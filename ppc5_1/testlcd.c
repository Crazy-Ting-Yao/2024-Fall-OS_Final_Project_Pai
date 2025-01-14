/*
 * file: testcoop.c
 */
#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "lcdlib.h"
#include "buttonlib.h"
/*
 * [TODO]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */
__data __at (0x30) char buffer[3];
__data __at (0x33) char currentButton;
__data __at (0x34) char mutex;
__data __at (0x35) char empty;
__data __at (0x36) char full;
__data __at (0x37) char producer_ptr;
__data __at (0x38) char consumer_ptr;
__data __at (0x39) char currentKey;
__data __at (0x3A) char pop;
/* [TODO for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
#define LABEL(x) x ## $
#define L(x) LABEL(x)
void Producer1(void)
{
    while (1){
        while(!AnyButtonPressed());
        __critical{
            currentButton = ButtonToChar();
        }
        SemaphoreWaitBody(empty,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        buffer[producer_ptr] = currentButton;
        producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        while (AnyButtonPressed());
    }
}

void Producer2(void)
{
    while (1){
        while (!AnyKeyPressed());
        __critical{
            currentKey = KeyToChar();
        }
        SemaphoreWaitBody(empty,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        buffer[producer_ptr] = currentKey;
        producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        while (AnyKeyPressed());
    }
}

/* [TODO for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void)
{
    consumer_ptr = 0;
    while (1){
        SemaphoreWaitBody(full,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        pop = buffer[consumer_ptr];
        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);
        consumer_ptr = (consumer_ptr == 2) ? 0 : consumer_ptr + 1;
        LCD_write_char(pop);
        while (!LCD_ready());
    }
}

/* [TODO for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void)
{
    /*
     * [TODO]
     * initialize globals
     */
    producer_ptr = 0;
    Init_Keypad();
    LCD_Init();
    SemaphoreCreate(full, 0);
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, 3);
    /*
     * [TODO]
     * set up Producer and Consumer.
     * Because both are infinite loops, there is no loop
     * in this function and no return.
     */
    ThreadCreate(Consumer);
    ThreadCreate(Producer2);
    Producer1();
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