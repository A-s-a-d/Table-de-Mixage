#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>
#include <string.h>

#define SPI_DEVICE "/dev/spidev0.0"  // SPI0, CE0

// Fonction pour configurer le bus SPI
int configure_spi(int fd) {
    int mode = SPI_MODE_0;  // Mode SPI (CPOL = 0, CPHA = 0)
    int bits_per_word = 8;  // 8 bits par mot
    int speed = 500000;     // Fréquence en Hz (500 kHz)

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
int spi_transfer(int fd, unsigned char *tx_buffer, unsigned char *rx_buffer, int length) {
    struct spi_ioc_transfer tr = {
        .tx_buf = (unsigned long)tx_buffer,
        .rx_buf = (unsigned long)rx_buffer,
        .len = length,
        .speed_hz = 500000,
        .delay_usecs = 0,
        .bits_per_word = 8,
    };

    if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0) {
        perror("Erreur lors du transfert SPI");
        return -1;
    }

    return 0;
}

int main() {
    int fd;
    unsigned char tx_buffer[3] = {0x11, 0x05, 0xff
    };  // Données à envoyer
    unsigned char rx_buffer[3] = {0};                 // Buffer pour la réponse

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
    while(1)
    {
    // Effectuer un transfert SPI
    if (spi_transfer(fd, tx_buffer, rx_buffer, sizeof(tx_buffer)) < 0) {
        close(fd);
        return EXIT_FAILURE;
    }

    // Afficher la réponse
    printf("Données envoyées :");
    for (int i = 0; i < sizeof(tx_buffer); i++) {
        printf("%02X ", tx_buffer[i]);
    }
    printf("\n");
    usleep(100000);
    }
    // Fermer le périphérique SPI
    close(fd);
    return EXIT_SUCCESS;
}