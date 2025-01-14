#
# makefile for testing cooperative multithreading
#
CC = sdcc
CFLAGS = -c  --model-small
LDFLAGS = 
LCD_OBJ = testlcd.rel preemptive.rel lcdlib.rel buttonlib.rel keylib.rel


all: testlcd.hex


testlcd.hex:   $(LCD_OBJ)
	$(CC) $(LDFLAGS) -o testlcd.hex $(LCD_OBJ)


clean:
	rm *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym
	
%.rel:  %.c    preemptive.h Makefile
	$(CC) $(CFLAGS) $<
