SRCDIR 		= src
INCLUDE_DIR = include
LIB_DIR 	= lib
LIB_HEADER	= lib/headers


SRCS = $(wildcard $(SRCDIR)/*.c )
OBJS = $(patsubst $(SRCDIR)/%.c, %.o, $(SRCS))
LINK_SCRIPT = linker.ld

CFLAGS = -Wall -O0 -ffreestanding -nostdinc -nostdlib -nostartfiles -g
CC = aarch64-linux-gnu-gcc
LINKER = aarch64-linux-gnu-ld
OBJ_CPY = aarch64-linux-gnu-objcopy
EMULATOR	= qemu-system-aarch64

VPATH = $(SRCDIR)
vpath %.c %.S $(SRCDIR) 

all: clean kernel8.img

clean:
	rm kernel8.elf kernel8.img *.o >/dev/null 2>/dev/null || true
	
start.o: start.S
	$(CC) $(CFLAGS)  -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

kernel8.img: start.o $(OBJS)
	$(LINKER) -nostdlib -nostartfiles $^ -T $(LINK_SCRIPT) -o kernel8.elf
	$(OBJ_CPY) -O binary kernel8.elf $@

loader: src/raspbootocm.cc
	gcc src/raspbootocm.cc -o raspbootocm



run:
	$(EMULATOR) -M raspi3 -kernel kernel8.img -serial null -serial stdio

	
