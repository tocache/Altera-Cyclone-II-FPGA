

#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

volatile unsigned char dato_in = 0;
volatile long tiempo = 0;

void main(void)
{
  alt_putstr("Hello from Nios II!\n");
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
