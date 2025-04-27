#include<stdint.h>

#define APP_START_ADDRESS 0x08008000U //Starting address of the application in flash memory
#define UART_DR_ADDRESS 0x40011004U //Address of the UART data register

void jump_to_application(void)
{
    uint32_t app_stack = *(volatile uint32_t *)(APP_START_ADDRESS); // Read the application stack pointer from the application address
    uint32_t app_reset_handler = *(volatile uint32_t *)(APP_START_ADDRESS+4); // Read the application reset handler address from the application address

    //set the main stack pointer to the application stack pointer
    __asm volatile("msr msp, %0" : : "r" (app_stack)); // Set the main stack pointer to the application stack pointer

    // Jump to the application reset handler
    ((void (*)(void))app_reset_handler)(); // Call the application reset handler
}

int main(void)
{
    uart_send_string("Initializing Device\n");
    // we can add some code here to validate the application code
    // For example, check if the application is valid by checking a specific memory location or checksum
    // or we can run some test to ensure all the peripherals are working correctly
    // we can also implement FOTA (Firmware Over-The-Air) update mechanism here
    
    // If the application is valid, jump to the application code
    uart_send_string("Jumping to application\n");
    jump_to_application();

    // If not, stay in the bootloader and wait for a new firmware update
    uart_send_string("No valid application code found\n");
    while(1)
    {
        // Wait for a new firmware update or perform other bootloader tasks
    }
}