/*
 * See Figure 3 of the STM32F072 datasheet [1].
 *
 * [1]: https://www.st.com/resource/en/datasheet/stm32f072c8.pdf
 */

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
    RAM   (rxw) : ORIGIN = 0x20000000, LENGTH = 16K
}

/*
 * The stack starts from the end of the RAM and grows inwards.
 */
_estack = 0x28000000;