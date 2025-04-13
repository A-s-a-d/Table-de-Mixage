#include "include_main.h"
#include "../lib/Half_sec/Half_sec.h"
#include "../lib/Sec/Sec.h"


// void* print_hello_world(void* arg) {
//     struct timespec req_1s, rem_1s;
//     req_1s.tv_sec = 1;
//     req_1s.tv_nsec = 0;

//     while (1) {
//         nanosleep(&req_1s, &rem_1s);  // Sleep for 1 second
//         printf("Hello, World!\n");
//     }

//     return NULL;
// }

// void* print_half_sec(void* arg) {
//     struct timespec req_H_s, rem_H_s;
//     req_H_s.tv_sec = 0;
//     req_H_s.tv_nsec = 500000000L;  // 0.5 seconds

//     while (1) {
//         nanosleep(&req_H_s, &rem_H_s);  // Sleep for 0.5 second
//         printf("Half Sec\n");
//     }

//     return NULL;
// }

int main() {
    pthread_t thread_1s, thread_H_s;

    // Create two threads for the two timed events
    pthread_create(&thread_1s, NULL, print_hello_world, NULL);
    pthread_create(&thread_H_s, NULL, print_half_sec, NULL);

    // Main thread can handle other tasks here, if needed
    while (1) {
        // Main thread can perform other tasks
        // Example: Simulate some other work in the main thread
        // (this will not block the timer threads)
    }

    return 0;
}
