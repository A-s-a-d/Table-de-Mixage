#include "Sec"

void* print_hello_world(void* arg) {
    struct timespec req_1s, rem_1s;
    req_1s.tv_sec = 1;
    req_1s.tv_nsec = 0;

    while (1) {
        nanosleep(&req_1s, &rem_1s);  // Sleep for 1 second
        printf("Hello, World!\n");
    }

    return NULL;
}