.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

@ constants
COUNT = 30000

@ register addresses
RCC_GPIO   = 0x40021014
GPIOC_MODE = 0x48000800
GPIOC_BSRR = 0x48000818

@ vector table
.word 0x28000000;
.word 0x080000ed;
.space 0xe4;

@ enable clock for GPIOC peripherals via RCC registers
LDR r0, =RCC_GPIO
LDR r1, =(1 << 19)
STR r1, [r0]

@ configure PC6 to general purpose output mode
LDR r0, =GPIOC_MODE
LDR r1, =(1 << (2*6))
STR r1, [r0]

ToggleRedLed:

@ configure PC6 to high
LDR r0, =GPIOC_BSRR
LDR r1, =(1 << 6)
STR r1, [r0]

@ counter for the delay loop
LDR r2, =COUNT

DelayLoopA:

@ decrement the delay loop counter by one
@ use APSR register to denote when r2 becomes negative (N) or zero (Z)
SUBS r2, #1
@ perform jump if Z flag is not enabled on APSR register
BNE DelayLoopA

@ configure PC6 to low
LDR r0, =GPIOC_BSRR
LDR r1, =(1 << 22)
STR r1, [r0]

LDR r2, =COUNT

DelayLoopB:

SUBS r2, #1
BNE DelayLoopB

B ToggleRedLed
