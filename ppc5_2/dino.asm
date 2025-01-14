;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Mac OS X ppc)
;--------------------------------------------------------
	.module dino
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _game_ctrl
	.globl _keypad_ctrl
	.globl _render_task
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ThreadReset
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _temp_print
	.globl _temp_shift
	.globl _lose
	.globl _points
	.globl _dinosaur_loc
	.globl _pop
	.globl _currentKey
	.globl _time
	.globl _map_down
	.globl _map_up
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_map_up	=	0x0030
_map_down	=	0x0032
_time	=	0x0034
_currentKey	=	0x0035
_pop	=	0x0036
_dinosaur_loc	=	0x0037
_points	=	0x0038
_lose	=	0x0039
_temp_shift	=	0x003a
_temp_print	=	0x003b
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_keypad_ctrl_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	dino.c:33: void render_task(void){
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	dino.c:34: while(1){
00151$:
;	dino.c:35: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:37: if(lose) ThreadYield();
	mov	a,_lose
	jz	00102$
	lcall	_ThreadYield
00102$:
;	dino.c:38: if(dinosaur_loc == 0){
	mov	a,_dinosaur_loc
	jnz	00106$
;	dino.c:39: if(map_up[0] & 0x40){
	mov	a,_map_up
	jnb	acc.6,00106$
;	dino.c:40: lose = 1;
	mov	_lose,#0x01
;	dino.c:41: ThreadYield();
	lcall	_ThreadYield
00106$:
;	dino.c:44: if(dinosaur_loc == 1){
	mov	a,#0x01
	cjne	a,_dinosaur_loc,00110$
;	dino.c:45: if(map_down[0] & 0x40){
	mov	a,_map_down
	jnb	acc.6,00110$
;	dino.c:46: lose = 1;
	mov	_lose,#0x01
;	dino.c:47: ThreadYield();
	lcall	_ThreadYield
00110$:
;	dino.c:50: temp_shift = 0;
	mov	_temp_shift,#0x00
;	dino.c:51: if(map_up[0] & 0x80){
	mov	a,_map_up
	jnb	acc.7,00112$
;	dino.c:52: temp_shift = 1;
	mov	_temp_shift,#0x01
00112$:
;	dino.c:54: map_up[0] <<= 1;
	mov	a,_map_up
	add	a,acc
	mov	r7,a
	mov	_map_up,r7
;	dino.c:55: if(map_up[1] & 0x80){
	mov	a,(_map_up + 0x0001)
	jnb	acc.7,00114$
;	dino.c:56: map_up[0]++;
	mov	a,_map_up
	inc	a
	mov	_map_up,a
00114$:
;	dino.c:58: map_up[1] <<= 1;
	mov	a,(_map_up + 0x0001)
	add	a,acc
	mov	r7,a
	mov	(_map_up + 0x0001),r7
;	dino.c:59: if(temp_shift){
	mov	a,_temp_shift
	jz	00116$
;	dino.c:60: points++;
	mov	a,_points
	inc	a
	mov	_points,a
;	dino.c:61: map_up[1]++;
	mov	a,(_map_up + 0x0001)
	inc	a
	mov	(_map_up + 0x0001),a
00116$:
;	dino.c:63: temp_shift = 0;
	mov	_temp_shift,#0x00
;	dino.c:64: if(map_down[0] & 0x80){
	mov	a,_map_down
	jnb	acc.7,00118$
;	dino.c:65: temp_shift = 1;
	mov	_temp_shift,#0x01
00118$:
;	dino.c:67: map_down[0] <<= 1;
	mov	a,_map_down
	add	a,acc
	mov	r7,a
	mov	_map_down,r7
;	dino.c:68: if(map_down[1] & 0x80){
	mov	a,(_map_down + 0x0001)
	jnb	acc.7,00120$
;	dino.c:69: map_down[0]++;
	mov	a,_map_down
	inc	a
	mov	_map_down,a
00120$:
;	dino.c:71: map_down[1] <<= 1;
	mov	a,(_map_down + 0x0001)
	add	a,acc
	mov	r7,a
	mov	(_map_down + 0x0001),r7
;	dino.c:72: if(temp_shift){
	mov	a,_temp_shift
	jz	00122$
;	dino.c:73: points++;
	mov	a,_points
	inc	a
	mov	_points,a
;	dino.c:74: map_down[1]++;
	mov	a,(_map_down + 0x0001)
	inc	a
	mov	(_map_down + 0x0001),a
00122$:
;	dino.c:76: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:77: temp_print = 0x80;
	mov	_temp_print,#0x80
;	dino.c:78: while(temp_print){
00126$:
	mov	a,_temp_print
	jz	00128$
;	dino.c:79: if(map_up[0] & temp_print){
	mov	a,_temp_print
	anl	a,_map_up
	jz	00124$
;	dino.c:80: LCD_write_char('\2');
	mov	dpl, #0x02
	lcall	_LCD_write_char
	sjmp	00125$
00124$:
;	dino.c:83: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
00125$:
;	dino.c:85: temp_print >>= 1;
	mov	a,_temp_print
	clr	c
	rrc	a
	mov	_temp_print,a
	sjmp	00126$
00128$:
;	dino.c:87: temp_print = 0x80;
	mov	_temp_print,#0x80
;	dino.c:88: while(temp_print != 1){
00132$:
	mov	a,#0x01
	cjne	a,_temp_print,00319$
	sjmp	00134$
00319$:
;	dino.c:89: if(map_up[1] & temp_print){
	mov	a,_temp_print
	anl	a,(_map_up + 0x0001)
	jz	00130$
;	dino.c:90: LCD_write_char('\2');
	mov	dpl, #0x02
	lcall	_LCD_write_char
	sjmp	00131$
00130$:
;	dino.c:93: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
00131$:
;	dino.c:95: temp_print >>= 1;
	mov	a,_temp_print
	clr	c
	rrc	a
	mov	_temp_print,a
	sjmp	00132$
00134$:
;	dino.c:97: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:98: temp_print = 0x80;
	mov	_temp_print,#0x80
;	dino.c:100: while(temp_print){
00138$:
	mov	a,_temp_print
	jz	00140$
;	dino.c:101: if(map_down[0] & temp_print){
	mov	a,_temp_print
	anl	a,_map_down
	jz	00136$
;	dino.c:102: LCD_write_char('\2');
	mov	dpl, #0x02
	lcall	_LCD_write_char
	sjmp	00137$
00136$:
;	dino.c:105: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
00137$:
;	dino.c:107: temp_print >>= 1;
	mov	a,_temp_print
	clr	c
	rrc	a
	mov	_temp_print,a
	sjmp	00138$
00140$:
;	dino.c:109: temp_print = 0x80;
	mov	_temp_print,#0x80
;	dino.c:110: while(temp_print != 1){
00144$:
	mov	a,#0x01
	cjne	a,_temp_print,00323$
	sjmp	00146$
00323$:
;	dino.c:111: if(map_down[1] & temp_print){
	mov	a,_temp_print
	anl	a,(_map_down + 0x0001)
	jz	00142$
;	dino.c:112: LCD_write_char('\2');
	mov	dpl, #0x02
	lcall	_LCD_write_char
	sjmp	00143$
00142$:
;	dino.c:115: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
00143$:
;	dino.c:117: temp_print >>= 1;
	mov	a,_temp_print
	clr	c
	rrc	a
	mov	_temp_print,a
	sjmp	00144$
00146$:
;	dino.c:120: if(dinosaur_loc == 0){
	mov	a,_dinosaur_loc
	jnz	00148$
;	dino.c:121: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:122: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
	sjmp	00149$
00148$:
;	dino.c:125: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:126: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
00149$:
;	dino.c:128: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:129: ThreadYield();
	lcall	_ThreadYield
;	dino.c:132: }
	ljmp	00151$
;------------------------------------------------------------
;Allocation info for local variables in function 'keypad_ctrl'
;------------------------------------------------------------
;	dino.c:134: void keypad_ctrl(void)
;	-----------------------------------------
;	 function keypad_ctrl
;	-----------------------------------------
_keypad_ctrl:
;	dino.c:143: while (!AnyKeyPressed());
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:144: currentKey = KeyToChar();
	lcall	_KeyToChar
	mov	_currentKey,dpl
;	dino.c:174: }
	setb	_keypad_ctrl_sloc0_1_0
	jbc	ea,00185$
	clr	_keypad_ctrl_sloc0_1_0
00185$:
;	dino.c:146: if(currentKey == '2'){
	mov	a,#0x32
	cjne	a,_currentKey,00109$
;	dino.c:147: if(dinosaur_loc == 1){
	mov	a,#0x01
	cjne	a,_dinosaur_loc,00109$
;	dino.c:148: if(map_up[0] & 0x80){
	mov	a,_map_up
	jnb	acc.7,00105$
;	dino.c:149: lose = 1;
	mov	_lose,#0x01
;	dino.c:150: ThreadYield();
	lcall	_ThreadYield
00105$:
;	dino.c:152: dinosaur_loc = 0;
	mov	_dinosaur_loc,#0x00
;	dino.c:153: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:154: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:155: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:156: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
00109$:
;	dino.c:160: if(currentKey == '8'){
	mov	a,#0x38
	cjne	a,_currentKey,00115$
;	dino.c:161: if(dinosaur_loc == 0){
	mov	a,_dinosaur_loc
	jnz	00115$
;	dino.c:162: if(map_down[0] & 0x80){
	mov	a,_map_down
	jnb	acc.7,00111$
;	dino.c:163: lose = 1;
	mov	_lose,#0x01
;	dino.c:164: ThreadYield();
	lcall	_ThreadYield
00111$:
;	dino.c:166: dinosaur_loc = 1;
	mov	_dinosaur_loc,#0x01
;	dino.c:167: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:168: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:169: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:170: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
00115$:
	mov	c,_keypad_ctrl_sloc0_1_0
	mov	ea,c
;	dino.c:175: while (AnyKeyPressed());
00116$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00116$
;	dino.c:177: }
	ljmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'game_ctrl'
;------------------------------------------------------------
;	dino.c:184: void game_ctrl(void)
;	-----------------------------------------
;	 function game_ctrl
;	-----------------------------------------
_game_ctrl:
;	dino.c:190: while (1){
00104$:
;	dino.c:191: if(lose){
	mov	a,_lose
	jnz	00120$
	ljmp	00102$
00120$:
;	dino.c:192: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:193: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:194: LCD_write_char('G');
	mov	dpl, #0x47
	lcall	_LCD_write_char
;	dino.c:195: LCD_write_char('A');
	mov	dpl, #0x41
	lcall	_LCD_write_char
;	dino.c:196: LCD_write_char('M');
	mov	dpl, #0x4d
	lcall	_LCD_write_char
;	dino.c:197: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:198: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:199: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:200: LCD_write_char('V');
	mov	dpl, #0x56
	lcall	_LCD_write_char
;	dino.c:201: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:202: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:203: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:204: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:205: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:206: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:207: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:208: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:209: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:210: LCD_write_char('S');
	mov	dpl, #0x53
	lcall	_LCD_write_char
;	dino.c:211: LCD_write_char('c');
	mov	dpl, #0x63
	lcall	_LCD_write_char
;	dino.c:212: LCD_write_char('o');
	mov	dpl, #0x6f
	lcall	_LCD_write_char
;	dino.c:213: LCD_write_char('r');
	mov	dpl, #0x72
	lcall	_LCD_write_char
;	dino.c:214: LCD_write_char('e');
	mov	dpl, #0x65
	lcall	_LCD_write_char
;	dino.c:215: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:216: LCD_write_char(':');
	mov	dpl, #0x3a
	lcall	_LCD_write_char
;	dino.c:217: LCD_write_char(points/10 + '0');
	mov	r6,_points
	mov	r7,#0x00
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),r7
	mov	dpl, r6
	mov	dph, r7
	lcall	__divsint
	mov	r6, dpl
	mov	a,#0x30
	add	a, r6
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:218: LCD_write_char(points%10 + '0');
	mov	r6,_points
	mov	r7,#0x00
	mov	__modsint_PARM_2,#0x0a
	mov	(__modsint_PARM_2 + 1),r7
	mov	dpl, r6
	mov	dph, r7
	lcall	__modsint
	mov	r6, dpl
	mov	a,#0x30
	add	a, r6
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:219: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:220: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:221: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:222: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:223: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:224: LCD_write_char(' ');
	mov	dpl, #0x20
;	dino.c:225: return;
	ljmp	_LCD_write_char
00102$:
;	dino.c:227: ThreadYield();
	lcall	_ThreadYield
;	dino.c:229: }
	ljmp	00104$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:236: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:242: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:243: LCD_Init();
	lcall	_LCD_Init
;	dino.c:244: LCD_entryModeSet(1, 1);
	mov	dpl, #0x07
	lcall	_LCD_IRWrite
;	dino.c:245: LCD_displayOnOffControl(1, 0, 0);
	mov	dpl, #0x0c
	lcall	_LCD_IRWrite
;	dino.c:246: do{
00117$:
;	dino.c:247: map_up[0] = 0x21;
	mov	_map_up,#0x21
;	dino.c:248: map_up[1] = 0xC4;
	mov	(_map_up + 0x0001),#0xc4
;	dino.c:249: map_down[0] = 0x08;
	mov	_map_down,#0x08
;	dino.c:250: map_down[1] = 0x11;
	mov	(_map_down + 0x0001),#0x11
;	dino.c:251: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:252: time = 0;
	mov	_time,#0x00
;	dino.c:253: lose = 0;
	mov	_lose,#0x00
;	dino.c:254: points = 0;
	mov	_points,#0x00
;	dino.c:255: dinosaur_loc = 0;
	mov	_dinosaur_loc,#0x00
;	dino.c:257: while(!AnyKeyPressed());
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:258: currentKey = KeyToChar();
	lcall	_KeyToChar
	mov	_currentKey,dpl
;	dino.c:259: while(AnyKeyPressed());
00104$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00104$
;	dino.c:260: if(currentKey == '#'){
	mov	a,#0x23
	cjne	a,_currentKey,00111$
;	dino.c:261: if(time == 0) continue;
	mov	a,_time
	jnz	00116$
;	dino.c:262: else break;
	sjmp	00101$
00111$:
;	dino.c:264: if(currentKey == '*'){
	mov	a,#0x2a
	cjne	a,_currentKey,00175$
	sjmp	00101$
00175$:
;	dino.c:267: time = (currentKey - '0');
	mov	a,_currentKey
	add	a,#0xd0
	mov	_time,a
	sjmp	00101$
00116$:
;	dino.c:276: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
;	dino.c:277: ThreadCreate(keypad_ctrl);
	mov	dptr,#_keypad_ctrl
	lcall	_ThreadCreate
;	dino.c:278: TMOD = 0; // timer 0 mode 0
	mov	_TMOD,#0x00
;	dino.c:279: TH0 = (time << 4);
	mov	a,_time
	swap	a
	anl	a,#0xf0
	mov	_TH0,a
;	dino.c:280: TL0 = 0x00;
	mov	_TL0,#0x00
;	dino.c:281: IE = 0x82; // enable timer 0 interrupt,
	mov	_IE,#0x82
;	dino.c:282: TR0 = 1; // start running timer0
;	assignBit
	setb	_TR0
;	dino.c:283: game_ctrl();
	lcall	_game_ctrl
;	dino.c:284: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:285: ThreadReset();
	lcall	_ThreadReset
;	dino.c:286: }while(1);
;	dino.c:287: }
	sjmp	00117$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:289: void _sdcc_gsinit_startup(void)
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	dino.c:293: __endasm;
	LJMP	_Bootstrap
;	dino.c:294: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:296: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:297: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:298: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:299: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	dino.c:302: __endasm;
	ljmp	_myTimer0Handler
;	dino.c:303: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
