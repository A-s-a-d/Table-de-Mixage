#include "Proj_external_lib.h"
#include "PIN_DEF.h"

#define PIN_LED GPIO_2

unsigned long Prev_nano = 0; // will store last time LED was updated
const long interval = 1000;  // interval at which to blink (ns)
int ledState = LOW;          // ledState used to set the LED

long get_time_nano_sec()
{
    struct timespec gettime_now;
    clock_gettime(CLOCK_REALTIME, &gettime_now);
    return gettime_now.tv_nsec;
}

void setup()
{

    printf("Raspberry Pi blink\n");
    if (wiringPiSetup() == -1)
    {
        // return 1;
    }
    pinMode(PIN_LED, OUTPUT);
    // return 0;
}

int main(void)
{
    setup();
    printf("MAIN after setup\n");

    while (1)
    {

        unsigned long curr_nano = get_time_nano_sec();
        if (curr_nano - Prev_nano >= interval)
        {

            Prev_nano = curr_nano;

            if (ledState == LOW)
            {
                ledState = HIGH;
            }
            else
            {
                ledState = LOW;
            }
            digitalWrite(PIN_LED, ledState);
        }
    }
    return 0;
}

// For Compile
//         gcc -o  blink blink.c - lwiringPi
