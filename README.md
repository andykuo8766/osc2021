# My OSC 2021 - LAB 00

## Author

| 學號 | GitHub 帳號 | 姓名 | Email |
| --- | ----------- | --- | --- |
|`L091197`| `andykuo8766` | `郭紘安` | andykuo8766@gapp.nthu.edu.tw |

## From Source Code to Kernel Image



### From Source Code to Object Files
```bash
aarch64-linux-gnu-gcc -c a.S
```
### From Object Files to ELF
```bash
aarch64-linux-gnu-ld -T linker.ld -o kernel8.elf a.o
```
### From ELF to Kernel Image
```bash
aarch64-linux-gnu-objcopy -O binary kernel8.elf kernel8.img
```
### Check on QEMU
```bash
qemu-system-aarch64 -M raspi3 -kernel kernel8.img -display none -d in_asm
```

### Debug on QEMU
Debugging on QEMU is a relatively easier way to validate your code. QEMU could dump memory, registers, and expose them to a debugger. You can use the following command waiting for gdb connection.
```bash
qemu-system-aarch64 -M raspi3 -kernel kernel8.img -display none -S -s
```
Then you can use the following command in gdb to load debugging information and connect to QEMU.
```bash
file kernel8.elf
target remote :1234
```
