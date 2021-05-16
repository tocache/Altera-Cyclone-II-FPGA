#include "sys/alt_stdio.h"
#include "system.h"
#include "alt_types.h"
#include "sys/alt_irq.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_lcd_16207_regs.h"

#define LCD_WR_COMMAND_REG 0
#define LCD_RD_STATUS_REG 1
#define LCD_WR_DATA_REG 2
#define LCD_RD_DATA_REG 3
#define LCD_0_BASE 0x5200

volatile unsigned char dato = 0;
volatile unsigned int x_var = 0;

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

const unsigned char auto_fantastico[] = {0x81, 0x42, 0x24, 0x18, 0x24, 0x42};

void lcd_init(void){
	 usleep(15000); /* Wait for more than 15 ms before init */

	 /* Set function code four times — 8-bit, 2 line, 5×7 mode */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(4100); /* Wait for more than 4.1 ms */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(100); /* Wait for more than 100 us */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(5000); /* Wait for more than 100 us */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(100); /* Wait for more than 100 us */

	 /* Set Display to OFF*/
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x08);
	 usleep(100);

	 /* Set Display to ON */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x0C);
	 usleep(100);

	 /* Set Entry Mode — Cursor increment, display doesn’t shift */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x06);
	 usleep(100);

	 /* Set the Cursor to the home position */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	 usleep(2000);
	 /* Display clear */
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x01);
	 usleep(2000);
}

void test_lcd(void) {
	int i;
	char message[16] = "Sistemas        ";   //ENTER YOUR  MESSAGE HERE
	char message2[16] = "      Digitales ";   //ENTER YOUR  MESSAGE HERE
	/* Set the Cursor to the home position */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	usleep(2000);

	/* Display clear */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x01);
	usleep(2000);

	/* Write a simple message on the first line. */
	for(i = 0; i < 16; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG,message[i]);
		usleep(100);
	}

	/* Display second line */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0xC0);
	usleep(2000);

	/* Write a simple message on the second line. */
	for(i = 0; i < 16; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG,message2[i]);
		usleep(100);
	}
}

void ESCRIBE_MENSAJE(const char *cadena,unsigned char tam)
{
	unsigned char i = 0;
	for(i = 0; i<tam; i++)
	{
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, cadena[i]);
		usleep(100);
	}
}

void main(void)
{
	lcd_init();
	alt_putstr("Hola terricola!\n");
//	test_lcd();
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	usleep(2000);
	ESCRIBE_MENSAJE("la miercoles", 12);
	while (1){
		for(x_var=0;x_var<6;x_var++){
			IOWR_ALTERA_AVALON_PIO_DATA(0x5100, auto_fantastico[x_var]);
			convierte(dato);
			IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0xC0);
			usleep(2000);
			IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0xC0);
			usleep(2000);
			IOWR(LCD_0_BASE, LCD_WR_DATA_REG, millar+0x30);
			usleep(100);
			IOWR(LCD_0_BASE, LCD_WR_DATA_REG, centena+0x30);
			usleep(100);
			IOWR(LCD_0_BASE, LCD_WR_DATA_REG, decena+0x30);
			usleep(100);
			IOWR(LCD_0_BASE, LCD_WR_DATA_REG, unidad+0x30);
			usleep(100);
			dato++;
			usleep(100000);
		}
	}
}
