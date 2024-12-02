#include <stdio.h>
#include <time.h>

int main() {
    struct timespec current, start; // POSIX.1b structure for a time value.
    long elapsed_ns; // .....
    long interval_ns = 1000000000L; // 1s in ns

    // Get the starting time
    clock_gettime(CLOCK_REALTIME, &start);

    while (1) {
        // Get the current time
        clock_gettime(CLOCK_REALTIME, &current);
        // Calculate the elapsed time in nanoseconds
        elapsed_ns = (current.tv_sec - start.tv_sec) * 1000000000L + (current.tv_nsec - start.tv_nsec);
        // Check if the elapsed time exceeds the interval
        if (elapsed_ns >= interval_ns) {
            // Print the message
            printf("Hello, World!\n");
            // Reset the starting time
            start = current;
        }
    }
    return 0;
}
