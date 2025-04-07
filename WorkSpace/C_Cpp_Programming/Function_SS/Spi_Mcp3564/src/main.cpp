#include "lib/MCP3564/MCP3564.h"
#include <stdio.h>

int main() {
    MCP3564 adc;

    if (!adc.begin()) {
        printf("Erreur d'initialisation du MCP3564\n");
        return -1;
    }

    printf("Configuration actuelle :\n");
    adc.printConfiguration();

    int32_t val0 = adc.read(0);
    int32_t val1 = adc.read(1);

    printf("Canal 0 : %ld\n", val0);
    printf("Canal 1 : %ld\n", val1);

    return 0;
}
