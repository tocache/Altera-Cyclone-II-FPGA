#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"

volatile long tiempo = 0;
volatile unsigned char lectura = 0;

int main()
{ 
  alt_putstr("Hello from Nios II!\n");
  /* Event loop never exits. */
  while (1){
	  lectura = IORD_ALTERA_AVALON_PIO_DATA(0x4200) & 0x01;
	  if((lectura) == 1){
		  tiempo = 200000;
		  alt_putstr("Tiempo largo!\n");
	  }
	  else{
		  tiempo = 50000;
		  alt_putstr("Tiempo corto!\n");
	  }
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x01);
	  alt_putstr("Foquito encendido!\n");
	  usleep(tiempo);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x00);
	  alt_putstr("Foquito apagado!\n");
	  usleep(tiempo);
  }
  return 0;
}
