#include <stdio.h>
#include <time.h>

int main() {
    struct timespec current, start_1s, start_H_s; // POSIX.1b structure for a time value.
    long elapsed_ns_1s, elapsed_ns_H_s; // Separate elapsed time variables
    long interval_ns = 1000000000L; // 1s in ns
    long interval_H_ns = 500000000L; // 0.5s in ns

    // Get the starting time
    clock_gettime(CLOCK_REALTIME, &start_1s);
    clock_gettime(CLOCK_REALTIME, &start_H_s);

    while (1) {
        // Get the current time
        clock_gettime(CLOCK_REALTIME, &current);

        // Calculate the elapsed time for 1-second interval in nanoseconds
        elapsed_ns_1s = (current.tv_sec - start_1s.tv_sec) * 1000000000L + (current.tv_nsec - start_1s.tv_nsec);

        // Calculate the elapsed time for 0.5-second interval in nanoseconds
        elapsed_ns_H_s = (current.tv_sec - start_H_s.tv_sec) * 1000000000L + (current.tv_nsec - start_H_s.tv_nsec);

        // Check if the elapsed time exceeds the 1-second interval
        if (elapsed_ns_1s >= interval_ns) {
            printf("Hello, World!\n");
            // Reset the starting time for 1-second interval
            start_1s = current;
        }

        // Check if the elapsed time exceeds the 0.5-second interval
        if (elapsed_ns_H_s >= interval_H_ns) {
            printf("Half Sec\n");
            // Reset the starting time for 0.5-second interval
            start_H_s = current;
        } 
    }
    return 0;
}
