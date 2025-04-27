ENTRY(main)

/*memory block - used to define the microcontroller memory layout*/
MEMORY
{
    FLASH (rx) : ORIGIN = 0x8000000, LENGTH = 512K 
    RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 128K
}

/*defining the locations for code and data*/
SECTIONS
{
    /*
    .text data comprises of all the executable code (functions, etc.) 
    including the read-only data (like const) and the interrupt vector table
    > FLASH means that these are stored inside FLASH memory
    */
    .text :{
        KEEP(*(.isr_vector))
        *(.text*)
        *(.rodata*)
    } > FLASH

    /*
    .data section consists of variables that are initialized with value
    > RAM AT > FLASH: store in RAM, but initial values are copied from FLASH at startup
    */
    .data :{
        *(.data*)
    } > RAM AT > FLASH

    /*
    .bss section consists of uninitialized global/static variables
    > RAM: stored in RAM
    */
    .bss :{
        *(.bss*)
        *(COMMON)
    } > RAM
}