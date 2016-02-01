CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-gcc
DB=arm-none-eabi-gdb

CCFLAGS=-mcpu=cortex-m0 -mthumb -g -Os -std=gnu11
SOURCE_FILES=$(wildcard *.c)
OBJ_FILES=$(patsubst %.c,%.o,$(SOURCE_FILES))
HEADERS=$(wildcard *.h)
LIBSPEC=-lgcc

all: firmware.hex

%.hex: %.elf
	objcopy -O ihex $< $@

firmware.elf: $(OBJ_FILES)
	$(LD) $(OBJ_FILES) $(LIBSPEC) -T lpc812_linker_script.ld -nostartfiles -o $@

%.o: %.c $(HEADERS)
	$(CC) -c $(CCFLAGS) $< -o $@

clean:
	rm -f $(OBJ_FILES) firmware.hex firmware.elf

upload: firmware.hex
	lpc21isp $< /dev/miniclock 115200 14746

openocd:
	openocd

# debug target assumes OpenOCD is already running on localhost
debug:
	$(DB) -tui -iex "file firmware.elf" -iex "target remote 127.0.0.1:3333" -ex "break init" -ex "continue"

.PHONY: clean upload debug openocd all
