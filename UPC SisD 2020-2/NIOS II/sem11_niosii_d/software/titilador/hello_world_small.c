#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

volatile unsigned char data_in = 0;
volatile long tiempo = 0;

void main(void)
{ 
	  alt_putstr("Hola electrolocos\n");
	  alt_putstr("Hola mecanolocos\n");

  /* Event loop never exits. */
  while (1){
	  data_in = IORD_ALTERA_AVALON_PIO_DATA(0x4200) & 0x01;
	  if (data_in  == 1){
		  tiempo = 50000;
	  }
	  else{
		  tiempo = 200000;
	  }
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x01);
	  usleep(tiempo);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x00);
	  usleep(tiempo);
  }
}
