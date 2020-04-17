.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

.global vector_table
.global reset_handler

.type vector_table, %object
vector_table:
    .word _estack
    .word reset_handler

.type reset_handler, %function
reset_handler:
    ldr r0, =0
    ldr r1, =1
    
    main_loop:
        adds r0, r0, #1
    B main_loop
