#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>
#include <stdint.h>
#include <string.h>

#define SPI_DEVICE "/dev/spidev0.0"  // SPI0, CE0
#define SPI_MODE SPI_MODE_0          // Mode SPI (CPOL = 0, CPHA = 0)
#define SPI_SPEED 500000             // Fréquence en Hz (500 kHz)
#define SPI_BITS_PER_WORD 8          // 8 bits par mot

// Adresses des registres du MCP3564
#define REG_CONFIG0 0x01
#define REG_ADC_DATA 0x5A

// Fonction pour configurer le bus SPI
int configure_spi(int fd) {
    uint8_t mode = SPI_MODE;
    uint8_t bits_per_word = SPI_BITS_PER_WORD;
    uint32_t speed = SPI_SPEED;

    // Définir le mode SPI
    if (ioctl(fd, SPI_IOC_WR_MODE, &mode) < 0) {
        perror("Erreur lors de la configuration du mode SPI");
        return -1;
    }

    // Définir le nombre de bits par mot
    if (ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits_per_word) < 0) {
        perror("Erreur lors de la configuration des bits par mot");
        return -1;
    }

    // Définir la vitesse de communication
    if (ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed) < 0) {
        perror("Erreur lors de la configuration de la vitesse SPI");
        return -1;
    }

    return 0;
}

// Fonction pour envoyer et recevoir des données via SPI
int spi_transfer(int fd, uint8_t *tx_buffer, uint8_t *rx_buffer, int length) {
    struct spi_ioc_transfer tr = {
        .tx_buf = (unsigned long)tx_buffer,
        .rx_buf = (unsigned long)rx_buffer,
        .len = length,
        .speed_hz = SPI_SPEED,
        .delay_usecs = 0,
        .bits_per_word = SPI_BITS_PER_WORD,
    };

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0) {
        perror("Erreur lors du transfert SPI");
        return -1;
    }

    return 0;
}

// Fonction pour lire un registre du MCP3564
int mcp3564_read_register(int fd, uint8_t reg_address, uint8_t *data, int length) {
    uint8_t tx_buffer[4] = {0};
    uint8_t rx_buffer[4] = {0};

    // Commande de lecture : 0x01 suivie de l'adresse du registre
    tx_buffer[0] = 0x01 | (reg_address << 1);

    // Effectuer le transfert SPI
    if (spi_transfer(fd, tx_buffer, rx_buffer, length + 1) < 0) {
        return -1;
    }

    // Copier les données reçues
    memcpy(data, rx_buffer + 1, length);
    return 0;
}

// Fonction pour écrire dans un registre du MCP3564
int mcp3564_write_register(int fd, uint8_t reg_address, uint8_t *data, int length) {
    uint8_t tx_buffer[4] = {0};
    uint8_t rx_buffer[4] = {0};

    // Commande d'écriture : 0x02 suivie de l'adresse du registre
    tx_buffer[0] = 0x02 | (reg_address << 1);
    memcpy(tx_buffer + 1, data, length);

    // Effectuer le transfert SPI
    if (spi_transfer(fd, tx_buffer, rx_buffer, length + 1) < 0) {
        return -1;
    }

    return 0;
}

int main() {
    int fd;
    uint8_t config0_data = 0x80;  // Exemple de configuration (à adapter)
    uint8_t adc_data[3] = {0};    // Buffer pour les données du CAN (24 bits)

    // Ouvrir le périphérique SPI
    fd = open(SPI_DEVICE, O_RDWR);
    if (fd < 0) {
        perror("Erreur lors de l'ouverture du périphérique SPI");
        return EXIT_FAILURE;
    }

    // Configurer le bus SPI
    if (configure_spi(fd) < 0) {
        close(fd);
        return EXIT_FAILURE;
    }

    // Configurer le MCP3564 (écrire dans REG_CONFIG0)
    if (mcp3564_write_register(fd, REG_CONFIG0, &config0_data, 1) < 0) {
        close(fd);
        return EXIT_FAILURE;
    }
    while(1)
    {
    // Lire les données du CAN (lire REG_ADC_DATA)
    if (mcp3564_read_register(fd, REG_ADC_DATA, adc_data, 3) < 0) {
        close(fd);
        return EXIT_FAILURE;
    }

    // Afficher les données du CAN
    uint32_t adc_value = (adc_data[0] << 16) | (adc_data[1] << 8) | adc_data[2];
    printf("Valeur du CAN : %u\n", adc_value);
    }
    // Fermer le périphérique SPI
    close(fd);
    return EXIT_SUCCESS;
}