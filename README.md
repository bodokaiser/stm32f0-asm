# STM32F0-ASM

This repository contains examples on how to write clean and minimal assembler code for the STM32F0.

I tested the examples on the [32F072BDISCOVERY Discovery kit][1].
Different STM32F0 may require a change of register addresses and pins.

I found [cortex-debug for vscode][2] very helpful to debug the assembler code.
It flashes the `main.elf` (produced by `make`) onto the microcontroller and allows the inspection of memory and peripheral register during a single execution.

## Usage

Clone the repository:

```
git clone https://github.com/bodokaiser/stm32f0-asm
```

Open Visual Studio Code (VSC):

```
code stm32f0-asm
```

Inside VSC, open an example, i.e. `blink/main.s` and run a build task in VSC (as an alternative, run `make`), start the debugger in VSC.

## References

1. The SVD file `STM32F072x.svd` required to debug the peripheral registers is copied from [posborne/cmsis-svd][3].
2. [This tutorial][4] is extremely helpful.
3. The [RM0091 Reference manual][5] describes the use of registers.
4. The [Cortex-M0 Generic User Guide][6] describes details of the M0 architecture, i.e. the vector table format.

[1]: https://www.st.com/en/evaluation-tools/32f072bdiscovery.html
[2]: https://github.com/Marus/cortex-debug
[3]: https://github.com/posborne/cmsis-svd
[4]: https://www.mikrocontroller.net/articles/ARM-ASM-Tutorial
[5]: https://www.st.com/resource/en/reference_manual/dm00031936-stm32f0x1-stm32f0x2-stm32f0x8-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf
[6]: http://infocenter.arm.com/help/topic/com.arm.doc.dui0497a/DUI0497A_cortex_m0_r0p0_generic_ug.pdf
