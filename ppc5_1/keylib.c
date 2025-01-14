/*
 * keylib.c
 * This is the library that works with the keypad.
 * it provides functions for
 * - initialize
 * - check any key pressed
 * - read the pressed key; in case of multiple, read highest priority
 */
#include <8051.h>
void Init_Keypad(void) {
	P3_3 = 1; // input mode from AND gate.
		// be sure to ENABLE the AND gate in Edsim51
	P0 = 0xf0; // configure column 3 bits (top) as input,
		// columns as pull-down.
		// Although we don't use the top bit for a column, 
		// we set it to 1 to be safe.
}
/*
 * boolean to quickly check if any key is pressed
 */
char AnyKeyPressed(void) {
	P0 = 0xf0;  // set all rows to pull-down
	return !P3_3; // true if any button is connected to pull-down
}
/*
 * read the keypad, return ASCII character if pressed. in case of
 * multiple keys, read the highest priority one.  If no keys pressed,
 * return null character.
 */
char KeyToChar(void) {
	P0 = 0xf7; // test the top row
	if (P0 == 0xb7) { return '1'; }
	if (P0 == 0xd7) { return '2'; }
	if (P0 == 0xe7) { return '3'; }
	P0 = 0xfb; // test the next row
	if (P0 == 0xbb) { return '4';}
	if (P0 == 0xdb) { return '5'; }
	if (P0 == 0xeb) { return '6'; }
	P0 = 0xfd;  // test the 3rd row
	if (P0 == 0xbd) { return '7';}
	if (P0 == 0xdd) { return '8'; }
	if (P0 == 0xed) { return '9'; }
	P0 = 0xfe;  // test the last row
	if (P0 == 0xbe) { return '*'; }
	if (P0 == 0xde) { return '0'; }
	if (P0 == 0xee) { return '#'; }
	return 0;
}
