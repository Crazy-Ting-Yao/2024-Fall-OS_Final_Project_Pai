#ifndef __LCDLIB_H__
#define __LCDLIB_H__
#define CLEAR_DISPLAY 1
#define RETURN_HOME   2
#define DEC_CURSOR    4
#define INC_CURSOR    6
#define SHIFT_DISPLAY_RIGHT 5
#define SHIFT_DISPLAY_LEFT  7
#define DISPLAY_OFF_CURSOR_OFF 8
#define DISPLAY_OFF_CURSOR_ON  0xA
#define DISPLAY_ON_CURSOR_OFF  0xC
#define DISPLAY_ON_CURSOR_BLINK 0xE
#define SHIFT_CURSOR_LEFT  0x10
#define SHIFT_CURSOR_RIGHT 0x14
#define SHIFT_ENTIRE_DISPLAY_LEFT 0x18
#define SHIFT_ENTIRE_DISPLAY_RIGHT 0x1C
#define FORCE_CURSOR_LINE_1_HEAD 0x80
#define FORCE_CURSOR_LINE_2_HEAD 0xC0
#define DISP_2_LINE_5x7_FONT  0x38
void LCD_Init(void);  /* initialize the LCD module */
void LCD_IRWrite(char c); /* writes to the instruction register */
#define LCD_returnHome() \
	LCD_IRWrite(RETURN_HOME)
#define LCD_clearScreen() \
	LCD_IRWrite(CLEAR_DISPLAY)
#define LCD_entryModeSet(id, s) \
	LCD_IRWrite(0x4 | ((id) << 1) | (s))
#define LCD_displayOnOffControl(display, cursor, blinking) \
	LCD_IRWrite(0x8 | ((display)<<2) | ((cursor) <<1) | (blinking))
#define LCD_cursorOrDisplayShift(sc, rl) \
	LCD_IRWrite(0x10 | ((sc) << 3) | ((rl) << 2))
#define LCD_setDdRamAddress(addr) \
	LCD_IRWrite(0x80 | (addr))
#define LCD_setCgRamAddress(addr) \
    LCD_IRWrite(0x40 | (addr))
// row, column
// row = 0,1, column = 0..f
#define LCD_cursorGoTo(row, col)\
	LCD_setDdRamAddress(((row)*0x40+(col)))
void LCD_functionSet(void) ;
void LCD_write_char(char c) ;
void LCD_write_string(char *s);
unsigned char LCD_ready(void);
#endif // __LCDLIB_H__
