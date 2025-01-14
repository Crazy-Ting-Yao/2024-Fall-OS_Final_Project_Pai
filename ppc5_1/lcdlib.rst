                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module lcdlib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _lcd_ready
                                    108 	.globl _LCD_ready
                                    109 	.globl _LCD_Init
                                    110 	.globl _LCD_IRWrite
                                    111 	.globl _LCD_functionSet
                                    112 	.globl _LCD_write_char
                                    113 	.globl _LCD_write_string
                                    114 	.globl _delay
                                    115 ;--------------------------------------------------------
                                    116 ; special function registers
                                    117 ;--------------------------------------------------------
                                    118 	.area RSEG    (ABS,DATA)
      000000                        119 	.org 0x0000
                           000080   120 _P0	=	0x0080
                           000081   121 _SP	=	0x0081
                           000082   122 _DPL	=	0x0082
                           000083   123 _DPH	=	0x0083
                           000087   124 _PCON	=	0x0087
                           000088   125 _TCON	=	0x0088
                           000089   126 _TMOD	=	0x0089
                           00008A   127 _TL0	=	0x008a
                           00008B   128 _TL1	=	0x008b
                           00008C   129 _TH0	=	0x008c
                           00008D   130 _TH1	=	0x008d
                           000090   131 _P1	=	0x0090
                           000098   132 _SCON	=	0x0098
                           000099   133 _SBUF	=	0x0099
                           0000A0   134 _P2	=	0x00a0
                           0000A8   135 _IE	=	0x00a8
                           0000B0   136 _P3	=	0x00b0
                           0000B8   137 _IP	=	0x00b8
                           0000D0   138 _PSW	=	0x00d0
                           0000E0   139 _ACC	=	0x00e0
                           0000F0   140 _B	=	0x00f0
                                    141 ;--------------------------------------------------------
                                    142 ; special function bits
                                    143 ;--------------------------------------------------------
                                    144 	.area RSEG    (ABS,DATA)
      000000                        145 	.org 0x0000
                           000080   146 _P0_0	=	0x0080
                           000081   147 _P0_1	=	0x0081
                           000082   148 _P0_2	=	0x0082
                           000083   149 _P0_3	=	0x0083
                           000084   150 _P0_4	=	0x0084
                           000085   151 _P0_5	=	0x0085
                           000086   152 _P0_6	=	0x0086
                           000087   153 _P0_7	=	0x0087
                           000088   154 _IT0	=	0x0088
                           000089   155 _IE0	=	0x0089
                           00008A   156 _IT1	=	0x008a
                           00008B   157 _IE1	=	0x008b
                           00008C   158 _TR0	=	0x008c
                           00008D   159 _TF0	=	0x008d
                           00008E   160 _TR1	=	0x008e
                           00008F   161 _TF1	=	0x008f
                           000090   162 _P1_0	=	0x0090
                           000091   163 _P1_1	=	0x0091
                           000092   164 _P1_2	=	0x0092
                           000093   165 _P1_3	=	0x0093
                           000094   166 _P1_4	=	0x0094
                           000095   167 _P1_5	=	0x0095
                           000096   168 _P1_6	=	0x0096
                           000097   169 _P1_7	=	0x0097
                           000098   170 _RI	=	0x0098
                           000099   171 _TI	=	0x0099
                           00009A   172 _RB8	=	0x009a
                           00009B   173 _TB8	=	0x009b
                           00009C   174 _REN	=	0x009c
                           00009D   175 _SM2	=	0x009d
                           00009E   176 _SM1	=	0x009e
                           00009F   177 _SM0	=	0x009f
                           0000A0   178 _P2_0	=	0x00a0
                           0000A1   179 _P2_1	=	0x00a1
                           0000A2   180 _P2_2	=	0x00a2
                           0000A3   181 _P2_3	=	0x00a3
                           0000A4   182 _P2_4	=	0x00a4
                           0000A5   183 _P2_5	=	0x00a5
                           0000A6   184 _P2_6	=	0x00a6
                           0000A7   185 _P2_7	=	0x00a7
                           0000A8   186 _EX0	=	0x00a8
                           0000A9   187 _ET0	=	0x00a9
                           0000AA   188 _EX1	=	0x00aa
                           0000AB   189 _ET1	=	0x00ab
                           0000AC   190 _ES	=	0x00ac
                           0000AF   191 _EA	=	0x00af
                           0000B0   192 _P3_0	=	0x00b0
                           0000B1   193 _P3_1	=	0x00b1
                           0000B2   194 _P3_2	=	0x00b2
                           0000B3   195 _P3_3	=	0x00b3
                           0000B4   196 _P3_4	=	0x00b4
                           0000B5   197 _P3_5	=	0x00b5
                           0000B6   198 _P3_6	=	0x00b6
                           0000B7   199 _P3_7	=	0x00b7
                           0000B0   200 _RXD	=	0x00b0
                           0000B1   201 _TXD	=	0x00b1
                           0000B2   202 _INT0	=	0x00b2
                           0000B3   203 _INT1	=	0x00b3
                           0000B4   204 _T0	=	0x00b4
                           0000B5   205 _T1	=	0x00b5
                           0000B6   206 _WR	=	0x00b6
                           0000B7   207 _RD	=	0x00b7
                           0000B8   208 _PX0	=	0x00b8
                           0000B9   209 _PT0	=	0x00b9
                           0000BA   210 _PX1	=	0x00ba
                           0000BB   211 _PT1	=	0x00bb
                           0000BC   212 _PS	=	0x00bc
                           0000D0   213 _P	=	0x00d0
                           0000D1   214 _F1	=	0x00d1
                           0000D2   215 _OV	=	0x00d2
                           0000D3   216 _RS0	=	0x00d3
                           0000D4   217 _RS1	=	0x00d4
                           0000D5   218 _F0	=	0x00d5
                           0000D6   219 _AC	=	0x00d6
                           0000D7   220 _CY	=	0x00d7
                                    221 ;--------------------------------------------------------
                                    222 ; overlayable register banks
                                    223 ;--------------------------------------------------------
                                    224 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        225 	.ds 8
                                    226 ;--------------------------------------------------------
                                    227 ; internal ram data
                                    228 ;--------------------------------------------------------
                                    229 	.area DSEG    (DATA)
                           00003E   230 _lcd_ready	=	0x003e
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable items in internal ram
                                    233 ;--------------------------------------------------------
                                    234 	.area	OSEG    (OVR,DATA)
                                    235 ;--------------------------------------------------------
                                    236 ; indirectly addressable internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area ISEG    (DATA)
                                    239 ;--------------------------------------------------------
                                    240 ; absolute internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area IABS    (ABS,DATA)
                                    243 	.area IABS    (ABS,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; bit data
                                    246 ;--------------------------------------------------------
                                    247 	.area BSEG    (BIT)
                                    248 ;--------------------------------------------------------
                                    249 ; paged external ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area PSEG    (PAG,XDATA)
                                    252 ;--------------------------------------------------------
                                    253 ; uninitialized external ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area XSEG    (XDATA)
                                    256 ;--------------------------------------------------------
                                    257 ; absolute external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area XABS    (ABS,XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; initialized external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XISEG   (XDATA)
                                    264 	.area HOME    (CODE)
                                    265 	.area GSINIT0 (CODE)
                                    266 	.area GSINIT1 (CODE)
                                    267 	.area GSINIT2 (CODE)
                                    268 	.area GSINIT3 (CODE)
                                    269 	.area GSINIT4 (CODE)
                                    270 	.area GSINIT5 (CODE)
                                    271 	.area GSINIT  (CODE)
                                    272 	.area GSFINAL (CODE)
                                    273 	.area CSEG    (CODE)
                                    274 ;--------------------------------------------------------
                                    275 ; global & static initialisations
                                    276 ;--------------------------------------------------------
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT  (CODE)
                                    279 	.area GSFINAL (CODE)
                                    280 	.area GSINIT  (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; Home
                                    283 ;--------------------------------------------------------
                                    284 	.area HOME    (CODE)
                                    285 	.area HOME    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; code
                                    288 ;--------------------------------------------------------
                                    289 	.area CSEG    (CODE)
                                    290 ;------------------------------------------------------------
                                    291 ;Allocation info for local variables in function 'LCD_ready'
                                    292 ;------------------------------------------------------------
                                    293 ;	lcdlib.c:16: unsigned char LCD_ready(void) {
                                    294 ;	-----------------------------------------
                                    295 ;	 function LCD_ready
                                    296 ;	-----------------------------------------
      000301                        297 _LCD_ready:
                           000007   298 	ar7 = 0x07
                           000006   299 	ar6 = 0x06
                           000005   300 	ar5 = 0x05
                           000004   301 	ar4 = 0x04
                           000003   302 	ar3 = 0x03
                           000002   303 	ar2 = 0x02
                           000001   304 	ar1 = 0x01
                           000000   305 	ar0 = 0x00
                                    306 ;	lcdlib.c:17: return lcd_ready;
      000301 85 3E 82         [24]  307 	mov	dpl, _lcd_ready
                                    308 ;	lcdlib.c:18: }
      000304 22               [24]  309 	ret
                                    310 ;------------------------------------------------------------
                                    311 ;Allocation info for local variables in function 'LCD_Init'
                                    312 ;------------------------------------------------------------
                                    313 ;	lcdlib.c:19: void LCD_Init(void) {
                                    314 ;	-----------------------------------------
                                    315 ;	 function LCD_Init
                                    316 ;	-----------------------------------------
      000305                        317 _LCD_Init:
                                    318 ;	lcdlib.c:20: LCD_functionSet();
      000305 12 03 3A         [24]  319 	lcall	_LCD_functionSet
                                    320 ;	lcdlib.c:21: LCD_entryModeSet(1, 1); /* increment and no shift */
      000308 75 82 07         [24]  321 	mov	dpl, #0x07
      00030B 12 03 18         [24]  322 	lcall	_LCD_IRWrite
                                    323 ;	lcdlib.c:22: LCD_displayOnOffControl(1, 1, 1); /* display on, cursor on and blinking on */
      00030E 75 82 0F         [24]  324 	mov	dpl, #0x0f
      000311 12 03 18         [24]  325 	lcall	_LCD_IRWrite
                                    326 ;	lcdlib.c:23: lcd_ready = 1;
      000314 75 3E 01         [24]  327 	mov	_lcd_ready,#0x01
                                    328 ;	lcdlib.c:24: }
      000317 22               [24]  329 	ret
                                    330 ;------------------------------------------------------------
                                    331 ;Allocation info for local variables in function 'LCD_IRWrite'
                                    332 ;------------------------------------------------------------
                                    333 ;c                         Allocated to registers r7 
                                    334 ;------------------------------------------------------------
                                    335 ;	lcdlib.c:25: void LCD_IRWrite(char c) {
                                    336 ;	-----------------------------------------
                                    337 ;	 function LCD_IRWrite
                                    338 ;	-----------------------------------------
      000318                        339 _LCD_IRWrite:
      000318 AF 82            [24]  340 	mov	r7, dpl
                                    341 ;	lcdlib.c:26: lcd_ready = 0;
      00031A 75 3E 00         [24]  342 	mov	_lcd_ready,#0x00
                                    343 ;	lcdlib.c:27: DB = (c & 0xf0); // high nibble, keep RS low
      00031D 74 F0            [12]  344 	mov	a,#0xf0
      00031F 5F               [12]  345 	anl	a,r7
      000320 F5 90            [12]  346 	mov	_P1,a
                                    347 ;	lcdlib.c:28: E = 1;  // pulse E
                                    348 ;	assignBit
      000322 D2 92            [12]  349 	setb	_P1_2
                                    350 ;	lcdlib.c:29: E = 0;
                                    351 ;	assignBit
      000324 C2 92            [12]  352 	clr	_P1_2
                                    353 ;	lcdlib.c:30: DB = (c << 4); // low nibble, keep RS low
      000326 EF               [12]  354 	mov	a,r7
      000327 C4               [12]  355 	swap	a
      000328 54 F0            [12]  356 	anl	a,#0xf0
      00032A F5 90            [12]  357 	mov	_P1,a
                                    358 ;	lcdlib.c:31: E = 1;
                                    359 ;	assignBit
      00032C D2 92            [12]  360 	setb	_P1_2
                                    361 ;	lcdlib.c:32: E = 0;
                                    362 ;	assignBit
      00032E C2 92            [12]  363 	clr	_P1_2
                                    364 ;	lcdlib.c:33: delay(DELAY_AMOUNT);
      000330 75 82 28         [24]  365 	mov	dpl, #0x28
      000333 12 03 C3         [24]  366 	lcall	_delay
                                    367 ;	lcdlib.c:34: lcd_ready = 1;
      000336 75 3E 01         [24]  368 	mov	_lcd_ready,#0x01
                                    369 ;	lcdlib.c:35: }
      000339 22               [24]  370 	ret
                                    371 ;------------------------------------------------------------
                                    372 ;Allocation info for local variables in function 'LCD_functionSet'
                                    373 ;------------------------------------------------------------
                                    374 ;	lcdlib.c:36: void LCD_functionSet(void) {
                                    375 ;	-----------------------------------------
                                    376 ;	 function LCD_functionSet
                                    377 ;	-----------------------------------------
      00033A                        378 _LCD_functionSet:
                                    379 ;	lcdlib.c:37: lcd_ready = 0;
      00033A 75 3E 00         [24]  380 	mov	_lcd_ready,#0x00
                                    381 ;	lcdlib.c:40: DB = 0x20;  // DB<7:4> = 0010, <RS,E,x,x>=0
      00033D 75 90 20         [24]  382 	mov	_P1,#0x20
                                    383 ;	lcdlib.c:41: E = 1;
                                    384 ;	assignBit
      000340 D2 92            [12]  385 	setb	_P1_2
                                    386 ;	lcdlib.c:42: E = 0;
                                    387 ;	assignBit
      000342 C2 92            [12]  388 	clr	_P1_2
                                    389 ;	lcdlib.c:43: delay(DELAY_AMOUNT);
      000344 75 82 28         [24]  390 	mov	dpl, #0x28
      000347 12 03 C3         [24]  391 	lcall	_delay
                                    392 ;	lcdlib.c:44: E = 1;
                                    393 ;	assignBit
      00034A D2 92            [12]  394 	setb	_P1_2
                                    395 ;	lcdlib.c:45: E = 0;
                                    396 ;	assignBit
      00034C C2 92            [12]  397 	clr	_P1_2
                                    398 ;	lcdlib.c:46: delay(DELAY_AMOUNT); // added, to ensure sufficient delay
      00034E 75 82 28         [24]  399 	mov	dpl, #0x28
      000351 12 03 C3         [24]  400 	lcall	_delay
                                    401 ;	lcdlib.c:47: DB7 = 1; // 2-line model
                                    402 ;	assignBit
      000354 D2 97            [12]  403 	setb	_P1_7
                                    404 ;	lcdlib.c:49: E = 1;
                                    405 ;	assignBit
      000356 D2 92            [12]  406 	setb	_P1_2
                                    407 ;	lcdlib.c:50: E = 0;
                                    408 ;	assignBit
      000358 C2 92            [12]  409 	clr	_P1_2
                                    410 ;	lcdlib.c:51: delay(DELAY_AMOUNT);
      00035A 75 82 28         [24]  411 	mov	dpl, #0x28
      00035D 12 03 C3         [24]  412 	lcall	_delay
                                    413 ;	lcdlib.c:52: lcd_ready = 1;
      000360 75 3E 01         [24]  414 	mov	_lcd_ready,#0x01
                                    415 ;	lcdlib.c:53: }
      000363 22               [24]  416 	ret
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'LCD_write_char'
                                    419 ;------------------------------------------------------------
                                    420 ;c                         Allocated to registers r7 
                                    421 ;------------------------------------------------------------
                                    422 ;	lcdlib.c:55: void LCD_write_char(char c) {
                                    423 ;	-----------------------------------------
                                    424 ;	 function LCD_write_char
                                    425 ;	-----------------------------------------
      000364                        426 _LCD_write_char:
      000364 AF 82            [24]  427 	mov	r7, dpl
                                    428 ;	lcdlib.c:56: lcd_ready = 0;
      000366 75 3E 00         [24]  429 	mov	_lcd_ready,#0x00
                                    430 ;	lcdlib.c:57: DB = (c & 0xf0) | 0x08; //; keep the RS
      000369 74 F0            [12]  431 	mov	a,#0xf0
      00036B 5F               [12]  432 	anl	a,r7
      00036C 44 08            [12]  433 	orl	a,#0x08
      00036E F5 90            [12]  434 	mov	_P1,a
                                    435 ;	lcdlib.c:58: RS = 1;
                                    436 ;	assignBit
      000370 D2 93            [12]  437 	setb	_P1_3
                                    438 ;	lcdlib.c:59: E = 1;
                                    439 ;	assignBit
      000372 D2 92            [12]  440 	setb	_P1_2
                                    441 ;	lcdlib.c:60: E = 0;
                                    442 ;	assignBit
      000374 C2 92            [12]  443 	clr	_P1_2
                                    444 ;	lcdlib.c:61: DB = (c << 4) | 0x08; // keep the RS
      000376 EF               [12]  445 	mov	a,r7
      000377 C4               [12]  446 	swap	a
      000378 54 F0            [12]  447 	anl	a,#0xf0
      00037A FF               [12]  448 	mov	r7,a
      00037B 74 08            [12]  449 	mov	a,#0x08
      00037D 4F               [12]  450 	orl	a,r7
      00037E F5 90            [12]  451 	mov	_P1,a
                                    452 ;	lcdlib.c:62: E = 1;
                                    453 ;	assignBit
      000380 D2 92            [12]  454 	setb	_P1_2
                                    455 ;	lcdlib.c:63: E = 0;
                                    456 ;	assignBit
      000382 C2 92            [12]  457 	clr	_P1_2
                                    458 ;	lcdlib.c:64: delay(DELAY_AMOUNT);
      000384 75 82 28         [24]  459 	mov	dpl, #0x28
      000387 12 03 C3         [24]  460 	lcall	_delay
                                    461 ;	lcdlib.c:65: lcd_ready = 1;
      00038A 75 3E 01         [24]  462 	mov	_lcd_ready,#0x01
                                    463 ;	lcdlib.c:66: }
      00038D 22               [24]  464 	ret
                                    465 ;------------------------------------------------------------
                                    466 ;Allocation info for local variables in function 'LCD_write_string'
                                    467 ;------------------------------------------------------------
                                    468 ;str                       Allocated to registers 
                                    469 ;------------------------------------------------------------
                                    470 ;	lcdlib.c:67: void LCD_write_string(char* str) {
                                    471 ;	-----------------------------------------
                                    472 ;	 function LCD_write_string
                                    473 ;	-----------------------------------------
      00038E                        474 _LCD_write_string:
      00038E AD 82            [24]  475 	mov	r5, dpl
      000390 AE 83            [24]  476 	mov	r6, dph
      000392 AF F0            [24]  477 	mov	r7, b
                                    478 ;	lcdlib.c:68: while (*str++) {
      000394                        479 00101$:
      000394 8D 82            [24]  480 	mov	dpl,r5
      000396 8E 83            [24]  481 	mov	dph,r6
      000398 8F F0            [24]  482 	mov	b,r7
      00039A 12 04 F4         [24]  483 	lcall	__gptrget
      00039D FC               [12]  484 	mov	r4,a
      00039E A3               [24]  485 	inc	dptr
      00039F AD 82            [24]  486 	mov	r5,dpl
      0003A1 AE 83            [24]  487 	mov	r6,dph
      0003A3 EC               [12]  488 	mov	a,r4
      0003A4 60 1C            [24]  489 	jz	00104$
                                    490 ;	lcdlib.c:69: LCD_write_char(*str);
      0003A6 8D 82            [24]  491 	mov	dpl,r5
      0003A8 8E 83            [24]  492 	mov	dph,r6
      0003AA 8F F0            [24]  493 	mov	b,r7
      0003AC 12 04 F4         [24]  494 	lcall	__gptrget
      0003AF F5 82            [12]  495 	mov	dpl,a
      0003B1 C0 07            [24]  496 	push	ar7
      0003B3 C0 06            [24]  497 	push	ar6
      0003B5 C0 05            [24]  498 	push	ar5
      0003B7 12 03 64         [24]  499 	lcall	_LCD_write_char
      0003BA D0 05            [24]  500 	pop	ar5
      0003BC D0 06            [24]  501 	pop	ar6
      0003BE D0 07            [24]  502 	pop	ar7
      0003C0 80 D2            [24]  503 	sjmp	00101$
      0003C2                        504 00104$:
                                    505 ;	lcdlib.c:71: }
      0003C2 22               [24]  506 	ret
                                    507 ;------------------------------------------------------------
                                    508 ;Allocation info for local variables in function 'delay'
                                    509 ;------------------------------------------------------------
                                    510 ;n                         Allocated to registers 
                                    511 ;------------------------------------------------------------
                                    512 ;	lcdlib.c:72: void delay(unsigned char n) {
                                    513 ;	-----------------------------------------
                                    514 ;	 function delay
                                    515 ;	-----------------------------------------
      0003C3                        516 _delay:
                                    517 ;	lcdlib.c:76: __endasm;
      0003C3                        518 dhere:
      0003C3 D5 82 FD         [24]  519 	djnz	dpl, dhere
                                    520 ;	lcdlib.c:78: }
      0003C6 22               [24]  521 	ret
                                    522 	.area CSEG    (CODE)
                                    523 	.area CONST   (CODE)
                                    524 	.area XINIT   (CODE)
                                    525 	.area CABS    (ABS,CODE)
