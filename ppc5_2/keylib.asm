;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (Mac OS X ppc)
;--------------------------------------------------------
	.module keylib
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _KeyToChar
	.globl _AnyKeyPressed
	.globl _Init_Keypad
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
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
_AnyKeyPressed_sloc0_1_0:
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Init_Keypad'
;------------------------------------------------------------
;	keylib.c:10: void Init_Keypad(void) {
;	-----------------------------------------
;	 function Init_Keypad
;	-----------------------------------------
_Init_Keypad:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	keylib.c:11: P3_3 = 1; // input mode from AND gate.
;	assignBit
	setb	_P3_3
;	keylib.c:13: P0 = 0xf0; // configure column 3 bits (top) as input,
	mov	_P0,#0xf0
;	keylib.c:17: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'AnyKeyPressed'
;------------------------------------------------------------
;	keylib.c:21: char AnyKeyPressed(void) {
;	-----------------------------------------
;	 function AnyKeyPressed
;	-----------------------------------------
_AnyKeyPressed:
;	keylib.c:22: P0 = 0xf0;  // set all rows to pull-down
	mov	_P0,#0xf0
;	keylib.c:23: return !P3_3; // true if any button is connected to pull-down
	mov	c,_P3_3
	cpl	c
	mov  _AnyKeyPressed_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
;	keylib.c:24: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'KeyToChar'
;------------------------------------------------------------
;	keylib.c:30: char KeyToChar(void) {
;	-----------------------------------------
;	 function KeyToChar
;	-----------------------------------------
_KeyToChar:
;	keylib.c:31: P0 = 0xf7; // test the top row
	mov	_P0,#0xf7
;	keylib.c:32: if (P0 == 0xb7) { return '1'; }
	mov	a,#0xb7
	cjne	a,_P0,00102$
	mov	dpl, #0x31
	ret
00102$:
;	keylib.c:33: if (P0 == 0xd7) { return '2'; }
	mov	a,#0xd7
	cjne	a,_P0,00104$
	mov	dpl, #0x32
	ret
00104$:
;	keylib.c:34: if (P0 == 0xe7) { return '3'; }
	mov	a,#0xe7
	cjne	a,_P0,00106$
	mov	dpl, #0x33
	ret
00106$:
;	keylib.c:35: P0 = 0xfb; // test the next row
	mov	_P0,#0xfb
;	keylib.c:36: if (P0 == 0xbb) { return '4';}
	mov	a,#0xbb
	cjne	a,_P0,00108$
	mov	dpl, #0x34
	ret
00108$:
;	keylib.c:37: if (P0 == 0xdb) { return '5'; }
	mov	a,#0xdb
	cjne	a,_P0,00110$
	mov	dpl, #0x35
	ret
00110$:
;	keylib.c:38: if (P0 == 0xeb) { return '6'; }
	mov	a,#0xeb
	cjne	a,_P0,00112$
	mov	dpl, #0x36
	ret
00112$:
;	keylib.c:39: P0 = 0xfd;  // test the 3rd row
	mov	_P0,#0xfd
;	keylib.c:40: if (P0 == 0xbd) { return '7';}
	mov	a,#0xbd
	cjne	a,_P0,00114$
	mov	dpl, #0x37
	ret
00114$:
;	keylib.c:41: if (P0 == 0xdd) { return '8'; }
	mov	a,#0xdd
	cjne	a,_P0,00116$
	mov	dpl, #0x38
	ret
00116$:
;	keylib.c:42: if (P0 == 0xed) { return '9'; }
	mov	a,#0xed
	cjne	a,_P0,00118$
	mov	dpl, #0x39
	ret
00118$:
;	keylib.c:43: P0 = 0xfe;  // test the last row
	mov	_P0,#0xfe
;	keylib.c:44: if (P0 == 0xbe) { return '*'; }
	mov	a,#0xbe
	cjne	a,_P0,00120$
	mov	dpl, #0x2a
	ret
00120$:
;	keylib.c:45: if (P0 == 0xde) { return '0'; }
	mov	a,#0xde
	cjne	a,_P0,00122$
	mov	dpl, #0x30
	ret
00122$:
;	keylib.c:46: if (P0 == 0xee) { return '#'; }
	mov	a,#0xee
	cjne	a,_P0,00124$
	mov	dpl, #0x23
	ret
00124$:
;	keylib.c:47: return 0;
	mov	dpl, #0x00
;	keylib.c:48: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
