#include <stdio.h>
#include <time.h>
#include <pthread.h>

// Mutex for thread synchronization (if needed)
pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;

// Function to print "Hello, World!" every 1 second
void* print_hello_world(void* arg) {
    struct timespec req_1s;
    req_1s.tv_sec = 1;
    req_1s.tv_nsec = 0;

    while (1) {
        nanosleep(&req_1s, NULL);  // Sleep for 1 second

        // Lock mutex before printing (to avoid potential data corruption)
        pthread_mutex_lock(&print_mutex);
        printf("Hello, World!\n");
        pthread_mutex_unlock(&print_mutex);  // Unlock mutex after printing
    }
    return NULL;
}

// Function to print "Half Sec" every 0.5 second
void* print_half_sec(void* arg) {
    struct timespec req_H_s;
    req_H_s.tv_sec = 0;
    req_H_s.tv_nsec = 500000000L;  // 0.5 seconds

    while (1) {
        nanosleep(&req_H_s, NULL);  // Sleep for 0.5 second

        // Lock mutex before printing
        pthread_mutex_lock(&print_mutex);
        printf("Half Sec\n");
        pthread_mutex_unlock(&print_mutex);  // Unlock mutex after printing
    }
    return NULL;
}

int main() {
    pthread_t thread_1s, thread_H_s;

    // Create threads to handle timed tasks
    pthread_create(&thread_1s, NULL, print_hello_world, NULL);
    pthread_create(&thread_H_s, NULL, print_half_sec, NULL);

    // Join threads (optional, depending on your needs)
    pthread_join(thread_1s, NULL);
    pthread_join(thread_H_s, NULL);

    // Main thread can continue doing other work if needed
    printf("Main thread finished.\n");

    return 0;
}
