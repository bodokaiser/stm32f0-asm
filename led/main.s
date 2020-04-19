.syntax unified
.cpu cortex-m0
.fpu softvfp
.thumb

/*
 * Register address constants that are replaced by the compiler.
 */
RCC_GPIO   = 0x40021014 @ Reset and clock control (RCC) register to enable GPIO.
GPIOC_MODE = 0x48000800 @ GPIO mode register to configure the mode, i.e. input or output of GPIOC.
GPIOC_BSRR = 0x48000818 @ GPIO bit set/reset register to set the GPIOC pins to high or low.

/*
 * Vector table.
 */
.word 0x28000000; @ End address of the memory, used as stack pointer.
.word 0x080000ed; @ Start address of the reset handler instructions.
.space 0xe4;      @ Empty space that can be used to define other (interrupt) handlers.

/*
 * Enable clock for GPIOC peripherals via RCC registers
 */
LDR r0, =RCC_GPIO  @ Load register address into r0.
LDR r1, =(1 << 19) @ Load register value into r1.
STR r1, [r0]       @ Set register value at register address.

/*
 * Enable clock for GPIOC peripherals via RCC registers.
 */
LDR r0, =GPIOC_MODE      @ Load register address into r0.
LDR r1, [r0]             @ Load value of register into r1.
LDR r2, =(1 << (2*6))    @ Enable bit 12 in r2.
ORRS r1, r2              @ r1 = r1 | r2. We need to use ORRS because ORR is not available for M0.
STR r1, [r0]             @ Set register to value of r1.

/*
 * Configure PC6 to high.
 */
LDR r0, =GPIOC_BSRR @ Load register address into r0.
LDR r1, =(1 << 6)   @ Enable bit 6 in r1.
STR r1, [r0]        @ Set register to value of r1.

B . @ Infinite loop.
