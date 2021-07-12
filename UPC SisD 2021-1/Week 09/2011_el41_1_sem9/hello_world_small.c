#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{ 
  alt_putstr("Hola Sistemas Digitales UPC 2021\n");
  alt_putstr("Somos del turno EL41 11AM\n");
  while (1){
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x01);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x02);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x04);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x08);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x10);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x20);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x40);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x80);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x40);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x20);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x10);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x08);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x04);
	  usleep(50000);
	  IOWR_ALTERA_AVALON_PIO_DATA(0x2000, 0x02);
	  usleep(50000);
  }
  return 0;
}
