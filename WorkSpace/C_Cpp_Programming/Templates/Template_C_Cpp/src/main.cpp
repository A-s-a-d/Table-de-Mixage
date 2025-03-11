#include <pthread.h>
#include "../lib/Module_1/Module_1.h"  // Adjust the relative path
#include "../lib/Module_2/Module_2.h"  // Adjust the relative path

int main() {
  Module_1();
  Module_2();
    // Main thread can handle other tasks here, if needed
    while (1) {
        // Main thread can perform other tasks
        // Example: Simulate some other work in the main thread
        // (this will not block the timer threads)
    }

    return 0;
}
