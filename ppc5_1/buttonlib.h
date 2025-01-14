
/*
 * This is the library for button bank.
 * it provides two functions: 
 * one to check if any button is pressed, 
 * and another to read the pressed button as ASCII; if multiple buttons
 * are pressed, then read the highest-priority button.
 */
#ifndef __BUTTONLIB_H__
#define __BUTTONLIB_H__
char AnyButtonPressed(void);
char ButtonToChar(void);
#endif // __BUTTONLIB_H__

