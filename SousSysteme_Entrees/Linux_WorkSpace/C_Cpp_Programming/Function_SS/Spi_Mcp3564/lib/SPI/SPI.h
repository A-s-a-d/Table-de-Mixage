#ifndef SPI_H
#define SPI_H

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>
#include <stdint.h>
#include <string.h>
#include <cstring>     // pour memset
#include <cstdio>      // pour perror

#define SPI_DEVICE "/dev/spidev0.0"  // SPI0, CE0

int configure_spi(int fd);
int spi_transfer(int fd, unsigned char *tx_buffer, unsigned char *rx_buffer, int length);



#endif
