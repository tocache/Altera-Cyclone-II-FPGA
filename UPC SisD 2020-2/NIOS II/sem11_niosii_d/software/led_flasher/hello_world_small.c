#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"

volatile unsigned char data_input = 0;
volatile long tiempo = 0;


void main(void){
	while(1){
		data_input = IORD_ALTERA_AVALON_PIO_DATA(0x4200) & 0x01;
		if(data_input == 1){
			tiempo = 200000;
			alt_putstr("Retardo leeeento\n");
		}
		else{
			tiempo = 50000;
			alt_putstr("Retardo rapido!\n");
		}
		IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x01);
		usleep(tiempo);
		IOWR_ALTERA_AVALON_PIO_DATA(0x4300, 0x00);
		usleep(tiempo);
	}
}
