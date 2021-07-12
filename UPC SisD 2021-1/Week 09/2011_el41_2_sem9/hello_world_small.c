#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "unistd.h"

int main()
{
  alt_putstr("Hola Sistemas Digitales UPC 2021 - 8\n");
  while (1){
		  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x55);
		  usleep(250000);
		  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0xAA);
		  usleep(250000);
  }
  return 0;
}
