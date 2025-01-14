#include <8051.h>

#include "preemptive.h"

/*
 * [TODO]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

__data __at (0x25) char savedSP[MAXTHREADS];
__data __at (0x29) char currentThread;
__data __at (0x2A) char threadMask;
__data __at (0x2B) char i;
__data __at (0x2C) char tempSP;
__data __at (0x2D) char newThread;
__data __at (0x2E) char temp;
__data __at (0x2F) char clockwise;
// __data __at (0x39) char DEBUG;

/*
 * [TODO]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE               \
    {                           \
        __asm                   \
        PUSH ACC                \
        PUSH B                  \
        PUSH DPL                \
        PUSH DPH                \
        PUSH PSW                \
        __endasm;               \
        savedSP[currentThread] = SP; \
    }

/*
 * [TODO]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE            \
    {                           \
        SP = savedSP[currentThread]; \
        __asm                   \
        POP PSW                 \
        POP DPH                 \
        POP DPL                 \
        POP B                   \
        POP ACC                 \
        __endasm;               \
    }

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void) {
    threadMask = 0;
    clockwise = 1;
    TMOD = 0; // timer 0 mode 0
    // TH0 = 0xD8;
    // TL0 = 0x00;
    IE = 0x82; // enable timer 0 interrupt,
    TR0 = 1; // start running timer0
    currentThread = ThreadCreate(main);
    RESTORESTATE;
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
void myTimer0Handler(void) {
    EA = 0; // don't do __critial
    SAVESTATE;
    do{
        if(clockwise){
            clockwise = !(currentThread == 3);
            currentThread = (currentThread == 3) ? 2 : currentThread + 1;
        } 
        else {
            clockwise = (currentThread == 0);
            currentThread = (currentThread == 0) ? 1 : currentThread - 1;
        }
        temp = 1 << currentThread;
        if (threadMask & temp){
            break;
        }
    } while (1);
    RESTORESTATE;
    // TH0 = 0xD8;
    // TL0 = 0x00;
    EA = 1;
    __asm
    RETI
    __endasm;
}

ThreadID ThreadCreate(FunctionPtr fp){
    /*
     * [TODO]
     * check to see we have not reached the max #threads.
     * if so, return -1, which is not a valid thread ID.
     */
    EA = 0;
    if(threadMask == 0x0F){
        return -1;
    }
    for(i = 0; i != MAXTHREADS; i++){
        // find a thread ID that is not in use
        temp = 1;
        temp <<= i;
        if(!(threadMask & temp)){
            // take it, update the bit mask
            threadMask |= temp;
            newThread = i;
            break;
        }
    }
    //save the current SP in a temporary
    tempSP = SP;
    //calculate the starting stack location for new thread
    //set SP to the starting location for the new thread
    SP = (0x3F) + newThread * (0x10);
    //push the return address fp
    __asm
        PUSH DPL
        PUSH DPH
    __endasm;
    // initialize the registers to 0
    __asm
        ANL A, #0
        PUSH ACC
        PUSH ACC
        PUSH ACC
        PUSH ACC
    __endasm;
    // push PSW
    PSW = (newThread << 3);
    __asm
        PUSH PSW
    __endasm;
    // write the current stack pointer to the saved stack pointer array for this newly created thread ID
    savedSP[newThread] = SP;
    // set SP to the saved SP in step c
    SP = tempSP;
    EA = 1;
    // return the newly created thread ID
    return newThread;
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void){
    EA = 0;
    SAVESTATE;
    do{
        /*
        * [TODO]
        * do round-robin policy for now.
        * find the next thread that can run and
        * set the current thread ID to it,
        * so that it can be restored (by the last line of
        * this function).
        * there should be at least one thread, so this loop
        * will always terminate.
        */
        currentThread = (currentThread < 3) ? currentThread + 1 : 0;
        temp = 1 << currentThread;
        if (threadMask & temp){
            // DEBUG = currentThread; 
            break;
        }
    } while (1);
    EA = 1;
    RESTORESTATE;
}
/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
{
    /*
     * clear the bit for the current thread from the
     * bit mask, decrement thread count (if any),
     * and set current thread to another valid ID.
     * Q: What happens if there are no more valid threads?
     */
    EA = 0;
    temp = 1 << currentThread;
    threadMask ^= temp;
    for(i = 0; i < MAXTHREADS; i++){
        temp = 1 << i;
        if(temp & threadMask){
            currentThread = i;
            break;
        }
    }
    if (i == MAXTHREADS){
        currentThread = -1;
    }
    RESTORESTATE;
    EA = 1;
}
