/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

volatile unsigned char dato = 0;

volatile unsigned int millar = 0;
volatile unsigned int centena = 0;
volatile unsigned int decena = 0;
volatile unsigned int unidad = 0;

void convierte(unsigned int numero){
    millar = numero /1000;
    centena = (numero % 1000) / 100;
    decena =  (numero % 100) / 10;
    unidad = numero % 10;
}

void retardo(volatile unsigned long tiempo){
	volatile unsigned long interno = 0;
	while(interno < tiempo*10000){
		interno++;
	}
}

int main()
{ 
  alt_putstr("Hola terricola!\n");
  alt_putstr("Somos estudiantes de ingenieria!\n");
  alt_putstr("Hemos implementado el NIOSII en el FPGA!\n");
  alt_putstr("Probando 1 2 3!\n");
  alt_putstr("COVID-19 te vamos a vencer!\n");
  alt_putstr("No nos quieren dejar entrar a las playas!\n");

  /* Event loop never exits. */
  while (1){
	  IOWR_ALTERA_AVALON_PIO_DATA(0x5100, 0x55);
	  dato = IORD_ALTERA_AVALON_PIO_DATA(0x5100);
	  convierte(dato);
	  alt_putstr("Dato en 0x5100:");
	  alt_putchar(centena+0x30);
	  alt_putchar(decena+0x30);
	  alt_putchar(unidad+0x30);
	  alt_putstr("\n");
	  retardo(5);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x5100, 0xAA);
	  dato = IORD_ALTERA_AVALON_PIO_DATA(0x5100);
	  convierte(dato);
	  alt_putstr("Dato en 0x5100:");
	  alt_putchar(centena+0x30);
	  alt_putchar(decena+0x30);
	  alt_putchar(unidad+0x30);
	  alt_putstr("\n");
	  retardo(5);
  }

  return 0;
}
