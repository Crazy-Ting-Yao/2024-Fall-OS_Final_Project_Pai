/*
 * file: testcoop.c
 */
#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "lcdlib.h"
/*
 * [TODO]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */
__data __at (0x30) unsigned char map_up[2];
__data __at (0x32) unsigned char map_down[2];
__data __at (0x34) unsigned char time;
__data __at (0x35) char currentKey;
__data __at (0x36) char pop;
__data __at (0x37) char dinosaur_loc;
__data __at (0x38) unsigned char points;
__data __at (0x39) unsigned char lose;
__data __at (0x3A) unsigned char temp_shift;
__data __at (0x3B) unsigned char temp_print;

/* [TODO for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void render_task(void){
    while(1){
        EA = 0;
        if(lose) ThreadYield();
        if(dinosaur_loc == 0){
            if(map_up[0] & 0x40){ lose = 1; ThreadYield(); }
        }
        if(dinosaur_loc == 1){
            if(map_down[0] & 0x40){ lose = 1; ThreadYield();}
        }
        temp_shift = 0;
        if(map_up[0] & 0x80) temp_shift = 1;
        map_up[0] <<= 1;
        if(map_up[1] & 0x80) map_up[0]++;
        map_up[1] <<= 1;
        if(temp_shift){ points++; map_up[1]++; }
        temp_shift = 0;
        if(map_down[0] & 0x80) temp_shift = 1;
        map_down[0] <<= 1;
        if(map_down[1] & 0x80) map_down[0]++;
        map_down[1] <<= 1;
        if(temp_shift){ points++; map_down[1]++; }
        LCD_cursorGoTo(0, 0);
        temp_print = 0x80;
        while(temp_print){ 
            if(map_up[0] & temp_print) LCD_write_char('\2'); 
            else LCD_write_char(' ');
            temp_print >>= 1;
        }
        temp_print = 0x80;
        while(temp_print != 1){
            if(map_up[1] & temp_print) LCD_write_char('\2');
            else LCD_write_char(' ');
            temp_print >>= 1;
        }
        LCD_cursorGoTo(1, 0);
        temp_print = 0x80;
        while(temp_print){
            if(map_down[0] & temp_print) LCD_write_char('\2');
            else LCD_write_char(' ');
            temp_print >>= 1;
        }
        temp_print = 0x80;
        while(temp_print != 1){
            if(map_down[1] & temp_print) LCD_write_char('\2');
            else LCD_write_char(' ');
            temp_print >>= 1;
        }

        if(dinosaur_loc == 0){
            LCD_cursorGoTo(0, 0);
            LCD_write_char('\1');
        }
        else{
            LCD_cursorGoTo(1, 0);
            LCD_write_char('\1');
        }
        EA = 1;
        ThreadYield();
    }
}

void keypad_ctrl(void)
{
    while (1){
        while (!AnyKeyPressed());
        currentKey = KeyToChar();
        __critical{
            if(currentKey == '2'){
                if(dinosaur_loc == 1){
                    if(map_up[0] & 0x80){
                        lose = 1;
                        ThreadYield();
                    }
                    dinosaur_loc = 0;
                    LCD_cursorGoTo(1, 0);
                    LCD_write_char(' ');
                    LCD_cursorGoTo(0, 0);
                    LCD_write_char('\1');
                    
                }
            }
            if(currentKey == '8'){
                if(dinosaur_loc == 0){
                    if(map_down[0] & 0x80){
                        lose = 1;
                        ThreadYield();
                    }
                    dinosaur_loc = 1;
                    LCD_cursorGoTo(0, 0);
                    LCD_write_char(' ');
                    LCD_cursorGoTo(1, 0);
                    LCD_write_char('\1');
                    
                }
            }
        }
        while (AnyKeyPressed());
    }
}

/* [TODO for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void game_ctrl(void)
{
    while (1){
        if(lose){
            EA = 0;
            LCD_cursorGoTo(0, 0);
            LCD_write_char('G');
            LCD_write_char('A');
            LCD_write_char('M');
            LCD_write_char('E');
            LCD_write_char(' ');
            LCD_write_char('O');
            LCD_write_char('V');
            LCD_write_char('E');
            LCD_write_char('R');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_cursorGoTo(1, 0);
            LCD_write_char('S');
            LCD_write_char('c');
            LCD_write_char('o');
            LCD_write_char('r');
            LCD_write_char('e');
            LCD_write_char(' ');
            LCD_write_char(':');
            LCD_write_char(points/10 + '0');
            LCD_write_char(points%10 + '0');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            return;
        }
        ThreadYield();
    }
}

/* [TODO for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void)
{
    Init_Keypad();
    LCD_Init();
    LCD_entryModeSet(1, 1);
    LCD_displayOnOffControl(1, 0, 0);
    do{
        map_up[0] = 0x21;
        map_up[1] = 0xC4;
        map_down[0] = 0x08;
        map_down[1] = 0x11;
        EA = 0;
        time = 0;
        lose = 0;
        points = 0;
        dinosaur_loc = 0;
        while(1){
            while(!AnyKeyPressed());
            currentKey = KeyToChar();
            while(AnyKeyPressed());
            if(currentKey == '#'){
                if(time == 0) continue;
                else break;
            }
            if(currentKey == '*'){
                continue;
            }
            time = (currentKey - '0');
        }
        ThreadCreate(render_task);
        ThreadCreate(keypad_ctrl);
        TMOD = 0; // timer 0 mode 0
        TH0 = (time << 4);
        TL0 = 0x00;
        IE = 0x82; // enable timer 0 interrupt,
        TR0 = 1; // start running timer0
        game_ctrl();
        EA = 0;
        ThreadReset();
    }while(1);
}

void _sdcc_gsinit_startup(void)
{

    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}