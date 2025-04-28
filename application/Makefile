# Toolchain
CC = arm-none-eabi-gcc
LD =arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
SIZE = arm-none-eabi-size

# Files and directories
SRC = src/application.c
OUT = application.elf
BIN = application.bin
MAP = application.map

#compiler and linker flags
#CFLAGS - things related to CPU, optimization, warnings
CFLAGS = -mcpu=cortex-m4 -mthumb -O0 -g -Wall

#LDFLAGS - things related to memory layout, linking maps, startup files
LDFLAGS = -nostartfiles -T linker.ld -Wl,-Map=$(MAP)

all: $(BIN)

#Build ELF file
$(OUT): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(OUT) $(LDFLAGS)

#create BIN file from ELF file
$(BIN): $(OUT)
	$(OBJCOPY) -O binary $(OUT) $(BIN)
	$(SIZE) $(OUT)

#clean build files
clean:
	rm -f $(OUT) $(BIN) $(MAP)