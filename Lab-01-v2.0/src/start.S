 .section ".text.boot"

.global _start

_start:
    mrs 		  x0, mpidr_el1
    and 		  x0, x0, 3
    cbz 		  x0, bss
proc_hang:
	b 		      proc_hang
	
bss:
    ldr  		  x0, = __bss_start
    ldr  		  x1, = __bss_end
    
//init bss     
init_bss:
    str  		  xzr, [x0]
    add  		  x0, x0, #8
    cmp  		  x0, x1
    ble  		  init_bss
    
    //init sp 
    ldr      	  x0, = _start
    mov           sp, x0
    
	//Jump to main.c 
    bl            kernel_main
    b             proc_hang