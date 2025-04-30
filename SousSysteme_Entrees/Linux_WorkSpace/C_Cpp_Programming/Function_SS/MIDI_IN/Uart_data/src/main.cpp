#include "Proj_external_lib.h"

int main()
{
    int fd;
    int count;
    unsigned int nextTime;

    // Open the serial port
    if ((fd = serialOpen("/dev/ttyS0", 115200)) < 0)
    {
        fprintf(stderr, "Unable to open serial device: %s\n", strerror(errno));
        return 1;
    }

    // Initialize wiringPi library
    if (wiringPiSetup() == -1)
    {
        fprintf(stdout, "Unable to start wiringPi: %s\n", strerror(errno));
        return 1;
    }
    uint8_t byte_count = 0;
    while (1)
    {
        // Check if data is available to read
        if (serialDataAvail(fd)) {
            unsigned char receivedByte = serialGetchar(fd); // Read a byte

            printf("%d ", receivedByte);
            fflush(stdout);
            byte_count++;
            if(byte_count==3)
            {
                printf("\n");
                byte_count = 0;
            } 
 
        
        }
    }

    serialClose(fd);
    printf("\n");
    return 0;
}
