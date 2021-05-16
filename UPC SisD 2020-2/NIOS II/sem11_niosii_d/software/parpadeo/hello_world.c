/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

volatile unsigned char dato_in = 0;
volatile long tiempo = 0;

void main(void)
{
  printf("Hello from Nios II!\n");
  while(1){
	  dato_in = (IORD_ALTERA_AVALON_PIO_DATA(0x4200)) & 0x01;
	  if(dato_in == 1){
		  tiempo = 200000;
	  }
	  else{
		  tiempo = 100000;
	  }
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x01);
	  usleep(tiempo);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x00);
	  usleep(tiempo);
  }
  return 0;
}
