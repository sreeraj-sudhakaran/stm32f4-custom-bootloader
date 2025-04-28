#include<stdint.h>

#define LED_PORT *((volatile uint32_t *)0x40021018) // Base address for the GPIO port
#define LED_ON (1<<5)

void app_main(void) {
    // Initialize the LED pin as output
    LED_PORT |= LED_ON; // Set the LED pin to high (turn on the LED)
    
    while(1) {
        // Main application loop
    }
}