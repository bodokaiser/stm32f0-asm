.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

RCC_GPIO   = 0x40021014
GPIOC_MODE = 0x48000800
GPIOC_BSSR = 0x48000818

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

@ configure PC6 to high
LDR r0, =GPIOC_BSSR
LDR r1, =(1 << 6)
STR r1, [r0]

NOP
B .
