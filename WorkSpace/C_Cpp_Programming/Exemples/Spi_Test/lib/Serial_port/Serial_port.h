#ifndef PIN_DEF_H
#define PIN_DEF_H

#include <termios.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/signal.h>
#include <sys/types.h>

/* baudrate settings are defined in <asm/termbits.h>, which is
        included by <termios.h> */
#define BAUDRATE B38400

/* change this definition for the correct port */
#define MODEMDEVICE "/dev/ttyAMA0"
#define _POSIX_SOURCE 1 /* POSIX compliant source */

#define FALSE 0
#define TRUE 1

volatile int STOP = FALSE;

void signal_handler_IO(int status); /* definition of signal handler */
int wait_flag = TRUE;               /* TRUE while no signal received */

#endif
