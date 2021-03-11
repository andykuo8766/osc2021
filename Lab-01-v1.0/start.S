 
.section ".text.boot"

.global _start

// set stack pointer and branch to main function.
_start:
    ldr       x0, = _start
    mov       sp, x0
	/*
	* Clear BSS section
	*/
	ldr x0, =__bss_start  /* this is auto-relocated! */
	ldr x1, =__bss_end   /* this is auto-relocated! */
	clear_loop:
	str xzr, [x0], #8
	cmp x0, x1
	b.lo clear_loop
    
    bl       main
1:     
    b       1b