#ifndef MCP3564_H
#define MCP3564_H

#include "SPI.h"
#include <stdint.h>
#include <stdio.h>

class MCP3564 {
private:
    int spi_fd;
    int writeRegister(uint8_t addr, uint32_t value, uint8_t nBytes);
    uint32_t readRegister(uint8_t addr, uint8_t nBytes);

public:
    MCP3564();
    bool begin();  // Init SPI and configure MCP
    void printConfiguration();
    int32_t read(uint8_t channel); // Read selected channel
};



#endif
