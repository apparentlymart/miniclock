CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld

CCFLAGS=-mcpu=cortex-m0 -mthumb -g -Os -std=gnu11
SOURCE_FILES=$(wildcard *.c)
OBJ_FILES=$(patsubst %.c,%.o,$(SOURCE_FILES))
HEADERS=$(wildcard *.h)

all: firmware.hex

%.hex: %.elf
	objcopy -O ihex $< $@

firmware.elf: $(OBJ_FILES)
	$(LD) $(OBJ_FILES) $(LIBSPEC) -T lpc812_linker_script.ld --cref -Map main.map -nostartfiles -o $@

%.o: %.c $(HEADERS)
	$(CC) -c $(CCFLAGS) $< -o $@

clean:
	rm -f $(OBJ_FILES) firmware.hex firmware.elf

upload: firmware.hex
	lpc21isp $< /dev/ttyUSB0 115200 14746
