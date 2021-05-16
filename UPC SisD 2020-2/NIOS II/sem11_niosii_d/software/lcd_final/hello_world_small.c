#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_lcd_16207_regs.h"

#define LCD_WR_COMMAND_REG 0
#define LCD_RD_STATUS_REG 1
#define LCD_WR_DATA_REG 2
#define LCD_RD_DATA_REG 3
#define LCD_0_BASE 0x5200

void lcd_init(void){
	 usleep(15000);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(4100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(5000);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	 usleep(100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x08);
	 usleep(100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x0C);
	 usleep(100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x06);
	 usleep(100);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	 usleep(2000);
	 IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x01);
	 usleep(2000);
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
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02); //Primera linea
	usleep(2000);
	ESCRIBE_MENSAJE("Hola UPC", 8);
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0xC0); //Segunda linea
	usleep(2000);
	ESCRIBE_MENSAJE("Sist. Digitales", 15);
	while (1);
}
