#include "./MCP3564.h"
#include <fcntl.h>
#include <unistd.h>

// MCP3564 command masks
#define MCP_WRITE_CMD 0x40
#define MCP_READ_CMD  0x01

// MCP3564 register addresses
#define MCP_REG_CONFIG0 0x01
#define MCP_REG_CONFIG1 0x02
#define MCP_REG_CONFIG2 0x03
#define MCP_REG_CONFIG3 0x04
#define MCP_REG_MUX     0x05
#define MCP_REG_ADC_DATA 0x0D

MCP3564::MCP3564() {
    spi_fd = -1;
}

bool MCP3564::begin() {
    spi_fd = open(SPI_DEVICE, O_RDWR);
    if (spi_fd < 0) {
        perror("Erreur lors de l'ouverture du périphérique SPI");
        return false;
    }

    if (configure_spi(spi_fd) < 0) {
        return false;
    }

    // CONFIG0 : OSR = 32 (0x0), Boost = 0, CLK_SEL = 0b01 (external clock)
    writeRegister(MCP_REG_CONFIG0, 0b00000001, 1);

    // CONFIG1 : Gain = 1 (0x0), Bias = 0
    writeRegister(MCP_REG_CONFIG1, 0b00000000, 1);

    // CONFIG2 : ADC mode = normal, offset calibration disabled
    writeRegister(MCP_REG_CONFIG2, 0b00000000, 1);

    // CONFIG3 : IRQ & status pin config (optional)
    writeRegister(MCP_REG_CONFIG3, 0b00000000, 1);

    return true;
}

int MCP3564::writeRegister(uint8_t addr, uint32_t value, uint8_t nBytes) {
    uint8_t tx[5] = { static_cast<uint8_t>(MCP_WRITE_CMD | (addr << 2)), 0, 0, 0, 0 };
    for (int i = 0; i < nBytes; i++) {
        tx[1 + i] = (value >> (8 * (nBytes - 1 - i))) & 0xFF;
    }

    uint8_t rx[5] = {0};
    return spi_transfer(spi_fd, tx, rx, 1 + nBytes);
}

uint32_t MCP3564::readRegister(uint8_t addr, uint8_t nBytes) {
    uint8_t tx[5] = { static_cast<uint8_t>(MCP_READ_CMD | (addr << 2)), 0, 0, 0, 0 };
    uint8_t rx[5] = {0};

    if (spi_transfer(spi_fd, tx, rx, 1 + nBytes) < 0)
        return 0;

    uint32_t result = 0;
    for (int i = 0; i < nBytes; i++) {
        result <<= 8;
        result |= rx[1 + i];
    }

    return result;
}

void MCP3564::printConfiguration() {
    printf("CONFIG0: 0x%02X\n", readRegister(MCP_REG_CONFIG0, 1));
    printf("CONFIG1: 0x%02X\n", readRegister(MCP_REG_CONFIG1, 1));
    printf("CONFIG2: 0x%02X\n", readRegister(MCP_REG_CONFIG2, 1));
    printf("CONFIG3: 0x%02X\n", readRegister(MCP_REG_CONFIG3, 1));
}

int32_t MCP3564::read(uint8_t channel) {
    if (channel > 7) return 0;

    uint8_t mux = (channel << 4) | 0x0F;  // CH+ = channel, CH- = VSS
    writeRegister(MCP_REG_MUX, mux, 1);

    usleep(5000); // Wait for conversion (adjust if needed)

    int32_t result = readRegister(MCP_REG_ADC_DATA, 3);

    // Convert to signed 24-bit
    if (result & 0x800000)
        result |= 0xFF000000;

    return result;
}
