PROJECT = firmware

CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -O0 -g -nostdlib

LDFLAGS = -T linker.ld -nostdlib


SRC = src/main.c startup/startup.c src/delay.c src/rtos/rtos.c src/uart/uart.c
ASM_SRC = src/rtos/context_switch.s 

OBJ = $(SRC:.c=.o)
ASM_OBJ = $(ASM_SRC:.s=.o)


all: build $(PROJECT).elf

build:
	mkdir -p build

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o build/$(notdir $@)

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o build/$(notdir $@)

$(PROJECT).elf: $(OBJ) $(ASM_OBJ)
	$(CC) $(CFLAGS) build/*.o -o build/$(PROJECT).elf $(LDFLAGS)

flash:
	openocd -f interface/stlink.cfg -f target/stm32f4x.cfg \
	-c "transport select swd" \
	-c "adapter_khz 1800" \
	-c "program build/firmware.elf verify reset exit"

clean:
	rm -rf build

gdb:
	arm-none-eabi-gdb build/firmware.elf

gdb_connect:
	target extended-remote localhost:3333

gdb_monitor:
	monitor reset halt

