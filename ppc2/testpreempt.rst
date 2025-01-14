                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _bufferFull
                                    117 	.globl _currentChar
                                    118 	.globl _buffer
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           00003A   234 _buffer	=	0x003a
                           00003B   235 _currentChar	=	0x003b
                           00003C   236 _bufferFull	=	0x003c
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area SSEG
      000021                        244 __start__stack:
      000021                        245 	.ds	1
                                    246 
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
      000000                        260 _Producer_sloc0_1_0:
      000000                        261 	.ds 1
      000001                        262 _Consumer_sloc0_1_0:
      000001                        263 	.ds 1
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; uninitialized external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; initialized external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; interrupt vector
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
      000000                        294 __interrupt_vect:
      000000 02 00 7D         [24]  295 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  296 	reti
      000004                        297 	.ds	7
      00000B 02 00 84         [24]  298 	ljmp	_timer0_ISR
                                    299 ;--------------------------------------------------------
                                    300 ; global & static initialisations
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 	.area GSFINAL (CODE)
                                    305 	.area GSINIT  (CODE)
                                    306 	.globl __sdcc_gsinit_startup
                                    307 	.globl __sdcc_program_startup
                                    308 	.globl __start__stack
                                    309 	.globl __mcs51_genXINIT
                                    310 	.globl __mcs51_genXRAMCLEAR
                                    311 	.globl __mcs51_genRAMCLEAR
                                    312 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  313 	ljmp	__sdcc_program_startup
                                    314 ;--------------------------------------------------------
                                    315 ; Home
                                    316 ;--------------------------------------------------------
                                    317 	.area HOME    (CODE)
                                    318 	.area HOME    (CODE)
      00000E                        319 __sdcc_program_startup:
      00000E 02 00 71         [24]  320 	ljmp	_main
                                    321 ;	return from main will return to caller
                                    322 ;--------------------------------------------------------
                                    323 ; code
                                    324 ;--------------------------------------------------------
                                    325 	.area CSEG    (CODE)
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'Producer'
                                    328 ;------------------------------------------------------------
                                    329 ;	testpreempt.c:27: void Producer(void)
                                    330 ;	-----------------------------------------
                                    331 ;	 function Producer
                                    332 ;	-----------------------------------------
      000014                        333 _Producer:
                           000007   334 	ar7 = 0x07
                           000006   335 	ar6 = 0x06
                           000005   336 	ar5 = 0x05
                           000004   337 	ar4 = 0x04
                           000003   338 	ar3 = 0x03
                           000002   339 	ar2 = 0x02
                           000001   340 	ar1 = 0x01
                           000000   341 	ar0 = 0x00
                                    342 ;	testpreempt.c:34: currentChar = 'A';
      000014 75 3B 41         [24]  343 	mov	_currentChar,#0x41
                                    344 ;	testpreempt.c:39: while (bufferFull);
      000017                        345 00101$:
      000017 E5 3C            [12]  346 	mov	a,_bufferFull
      000019 70 FC            [24]  347 	jnz	00101$
                                    348 ;	testpreempt.c:43: }
      00001B D2 00            [12]  349 	setb	_Producer_sloc0_1_0
      00001D 10 AF 02         [24]  350 	jbc	ea,00130$
      000020 C2 00            [12]  351 	clr	_Producer_sloc0_1_0
      000022                        352 00130$:
                                    353 ;	testpreempt.c:41: buffer = currentChar;
      000022 85 3B 3A         [24]  354 	mov	_buffer,_currentChar
                                    355 ;	testpreempt.c:42: bufferFull = 1;
      000025 75 3C 01         [24]  356 	mov	_bufferFull,#0x01
      000028 A2 00            [12]  357 	mov	c,_Producer_sloc0_1_0
      00002A 92 AF            [24]  358 	mov	ea,c
                                    359 ;	testpreempt.c:44: currentChar = (currentChar == 'Z') ? 'A' : currentChar + 1;
      00002C 74 5A            [12]  360 	mov	a,#0x5a
      00002E B5 3B 04         [24]  361 	cjne	a,_currentChar,00109$
      000031 7E 41            [12]  362 	mov	r6,#0x41
      000033 80 08            [24]  363 	sjmp	00110$
      000035                        364 00109$:
      000035 AD 3B            [24]  365 	mov	r5,_currentChar
      000037 0D               [12]  366 	inc	r5
      000038 ED               [12]  367 	mov	a,r5
      000039 FE               [12]  368 	mov	r6,a
      00003A 33               [12]  369 	rlc	a
      00003B 95 E0            [12]  370 	subb	a,acc
      00003D                        371 00110$:
      00003D 8E 3B            [24]  372 	mov	_currentChar,r6
                                    373 ;	testpreempt.c:47: }
      00003F 80 D6            [24]  374 	sjmp	00101$
                                    375 ;------------------------------------------------------------
                                    376 ;Allocation info for local variables in function 'Consumer'
                                    377 ;------------------------------------------------------------
                                    378 ;	testpreempt.c:54: void Consumer(void)
                                    379 ;	-----------------------------------------
                                    380 ;	 function Consumer
                                    381 ;	-----------------------------------------
      000041                        382 _Consumer:
                                    383 ;	testpreempt.c:65: }
      000041 D2 01            [12]  384 	setb	_Consumer_sloc0_1_0
      000043 10 AF 02         [24]  385 	jbc	ea,00136$
      000046 C2 01            [12]  386 	clr	_Consumer_sloc0_1_0
      000048                        387 00136$:
                                    388 ;	testpreempt.c:61: TMOD |= 0x20;
      000048 43 89 20         [24]  389 	orl	_TMOD,#0x20
                                    390 ;	testpreempt.c:62: TH1 = -6;
      00004B 75 8D FA         [24]  391 	mov	_TH1,#0xfa
                                    392 ;	testpreempt.c:63: SCON = 0x50;
      00004E 75 98 50         [24]  393 	mov	_SCON,#0x50
                                    394 ;	testpreempt.c:64: TR1 = 1;
                                    395 ;	assignBit
      000051 D2 8E            [12]  396 	setb	_TR1
      000053 A2 01            [12]  397 	mov	c,_Consumer_sloc0_1_0
      000055 92 AF            [24]  398 	mov	ea,c
                                    399 ;	testpreempt.c:71: while (!bufferFull);
      000057                        400 00101$:
      000057 E5 3C            [12]  401 	mov	a,_bufferFull
      000059 60 FC            [24]  402 	jz	00101$
                                    403 ;	testpreempt.c:81: }
      00005B D2 01            [12]  404 	setb	_Consumer_sloc0_1_0
      00005D 10 AF 02         [24]  405 	jbc	ea,00138$
      000060 C2 01            [12]  406 	clr	_Consumer_sloc0_1_0
      000062                        407 00138$:
                                    408 ;	testpreempt.c:79: SBUF = buffer;
      000062 85 3A 99         [24]  409 	mov	_SBUF,_buffer
                                    410 ;	testpreempt.c:80: bufferFull = 0;
      000065 75 3C 00         [24]  411 	mov	_bufferFull,#0x00
      000068 A2 01            [12]  412 	mov	c,_Consumer_sloc0_1_0
      00006A 92 AF            [24]  413 	mov	ea,c
                                    414 ;	testpreempt.c:82: while (!TI);
      00006C                        415 00104$:
                                    416 ;	testpreempt.c:83: TI = 0;
                                    417 ;	assignBit
      00006C 10 99 E8         [24]  418 	jbc	_TI,00101$
                                    419 ;	testpreempt.c:85: }
      00006F 80 FB            [24]  420 	sjmp	00104$
                                    421 ;------------------------------------------------------------
                                    422 ;Allocation info for local variables in function 'main'
                                    423 ;------------------------------------------------------------
                                    424 ;	testpreempt.c:92: void main(void)
                                    425 ;	-----------------------------------------
                                    426 ;	 function main
                                    427 ;	-----------------------------------------
      000071                        428 _main:
                                    429 ;	testpreempt.c:98: bufferFull = 0;
      000071 75 3C 00         [24]  430 	mov	_bufferFull,#0x00
                                    431 ;	testpreempt.c:105: ThreadCreate(Producer);
      000074 90 00 14         [24]  432 	mov	dptr,#_Producer
      000077 12 01 03         [24]  433 	lcall	_ThreadCreate
                                    434 ;	testpreempt.c:106: Consumer();
                                    435 ;	testpreempt.c:107: }
      00007A 02 00 41         [24]  436 	ljmp	_Consumer
                                    437 ;------------------------------------------------------------
                                    438 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    439 ;------------------------------------------------------------
                                    440 ;	testpreempt.c:109: void _sdcc_gsinit_startup(void)
                                    441 ;	-----------------------------------------
                                    442 ;	 function _sdcc_gsinit_startup
                                    443 ;	-----------------------------------------
      00007D                        444 __sdcc_gsinit_startup:
                                    445 ;	testpreempt.c:113: __endasm;
      00007D 02 00 88         [24]  446 	LJMP	_Bootstrap
                                    447 ;	testpreempt.c:114: }
      000080 22               [24]  448 	ret
                                    449 ;------------------------------------------------------------
                                    450 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    451 ;------------------------------------------------------------
                                    452 ;	testpreempt.c:116: void _mcs51_genRAMCLEAR(void) {}
                                    453 ;	-----------------------------------------
                                    454 ;	 function _mcs51_genRAMCLEAR
                                    455 ;	-----------------------------------------
      000081                        456 __mcs51_genRAMCLEAR:
      000081 22               [24]  457 	ret
                                    458 ;------------------------------------------------------------
                                    459 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    460 ;------------------------------------------------------------
                                    461 ;	testpreempt.c:117: void _mcs51_genXINIT(void) {}
                                    462 ;	-----------------------------------------
                                    463 ;	 function _mcs51_genXINIT
                                    464 ;	-----------------------------------------
      000082                        465 __mcs51_genXINIT:
      000082 22               [24]  466 	ret
                                    467 ;------------------------------------------------------------
                                    468 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    469 ;------------------------------------------------------------
                                    470 ;	testpreempt.c:118: void _mcs51_genXRAMCLEAR(void) {}
                                    471 ;	-----------------------------------------
                                    472 ;	 function _mcs51_genXRAMCLEAR
                                    473 ;	-----------------------------------------
      000083                        474 __mcs51_genXRAMCLEAR:
      000083 22               [24]  475 	ret
                                    476 ;------------------------------------------------------------
                                    477 ;Allocation info for local variables in function 'timer0_ISR'
                                    478 ;------------------------------------------------------------
                                    479 ;	testpreempt.c:119: void timer0_ISR(void) __interrupt(1) {
                                    480 ;	-----------------------------------------
                                    481 ;	 function timer0_ISR
                                    482 ;	-----------------------------------------
      000084                        483 _timer0_ISR:
                                    484 ;	testpreempt.c:122: __endasm;
      000084 02 00 AE         [24]  485 	ljmp	_myTimer0Handler
                                    486 ;	testpreempt.c:123: }
      000087 32               [24]  487 	reti
                                    488 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    489 ;	eliminated unneeded push/pop not_psw
                                    490 ;	eliminated unneeded push/pop dpl
                                    491 ;	eliminated unneeded push/pop dph
                                    492 ;	eliminated unneeded push/pop b
                                    493 ;	eliminated unneeded push/pop acc
                                    494 	.area CSEG    (CODE)
                                    495 	.area CONST   (CODE)
                                    496 	.area XINIT   (CODE)
                                    497 	.area CABS    (ABS,CODE)
