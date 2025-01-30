
#include "Half_sec"

void* print_half_sec(void* arg) {
    struct timespec req_H_s, rem_H_s;
    req_H_s.tv_sec = 0;
    req_H_s.tv_nsec = 500000000L;  // 0.5 seconds

    while (1) {
        nanosleep(&req_H_s, &rem_H_s);  // Sleep for 0.5 second
        printf("Half Sec\n");
    }

    return NULL;
}