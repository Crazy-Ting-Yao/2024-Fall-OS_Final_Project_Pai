                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module testcoop
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl __sdcc_gsinit_startup
                                     15 	.globl _main
                                     16 	.globl _Consumer
                                     17 	.globl _Producer
                                     18 	.globl _ThreadYield
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
      000008                        244 __start__stack:
      000008                        245 	.ds	1
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
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; uninitialized external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; absolute external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XABS    (ABS,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; initialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XISEG   (XDATA)
                                    276 	.area HOME    (CODE)
                                    277 	.area GSINIT0 (CODE)
                                    278 	.area GSINIT1 (CODE)
                                    279 	.area GSINIT2 (CODE)
                                    280 	.area GSINIT3 (CODE)
                                    281 	.area GSINIT4 (CODE)
                                    282 	.area GSINIT5 (CODE)
                                    283 	.area GSINIT  (CODE)
                                    284 	.area GSFINAL (CODE)
                                    285 	.area CSEG    (CODE)
                                    286 ;--------------------------------------------------------
                                    287 ; interrupt vector
                                    288 ;--------------------------------------------------------
                                    289 	.area HOME    (CODE)
      000000                        290 __interrupt_vect:
      000000 02 00 62         [24]  291 	ljmp	__sdcc_gsinit_startup
                                    292 ;--------------------------------------------------------
                                    293 ; global & static initialisations
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 	.area GSFINAL (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 	.globl __sdcc_gsinit_startup
                                    300 	.globl __sdcc_program_startup
                                    301 	.globl __start__stack
                                    302 	.globl __mcs51_genXINIT
                                    303 	.globl __mcs51_genXRAMCLEAR
                                    304 	.globl __mcs51_genRAMCLEAR
                                    305 	.area GSFINAL (CODE)
      000006 02 00 03         [24]  306 	ljmp	__sdcc_program_startup
                                    307 ;--------------------------------------------------------
                                    308 ; Home
                                    309 ;--------------------------------------------------------
                                    310 	.area HOME    (CODE)
                                    311 	.area HOME    (CODE)
      000003                        312 __sdcc_program_startup:
      000003 02 00 56         [24]  313 	ljmp	_main
                                    314 ;	return from main will return to caller
                                    315 ;--------------------------------------------------------
                                    316 ; code
                                    317 ;--------------------------------------------------------
                                    318 	.area CSEG    (CODE)
                                    319 ;------------------------------------------------------------
                                    320 ;Allocation info for local variables in function 'Producer'
                                    321 ;------------------------------------------------------------
                                    322 ;	testcoop.c:27: void Producer(void)
                                    323 ;	-----------------------------------------
                                    324 ;	 function Producer
                                    325 ;	-----------------------------------------
      000009                        326 _Producer:
                           000007   327 	ar7 = 0x07
                           000006   328 	ar6 = 0x06
                           000005   329 	ar5 = 0x05
                           000004   330 	ar4 = 0x04
                           000003   331 	ar3 = 0x03
                           000002   332 	ar2 = 0x02
                           000001   333 	ar1 = 0x01
                           000000   334 	ar0 = 0x00
                                    335 ;	testcoop.c:34: currentChar = 'A';
      000009 75 3B 41         [24]  336 	mov	_currentChar,#0x41
                                    337 ;	testcoop.c:40: while (bufferFull){
      00000C                        338 00101$:
      00000C E5 3C            [12]  339 	mov	a,_bufferFull
      00000E 60 05            [24]  340 	jz	00103$
                                    341 ;	testcoop.c:41: ThreadYield();
      000010 12 01 0C         [24]  342 	lcall	_ThreadYield
      000013 80 F7            [24]  343 	sjmp	00101$
      000015                        344 00103$:
                                    345 ;	testcoop.c:43: buffer = currentChar;
      000015 85 3B 3A         [24]  346 	mov	_buffer,_currentChar
                                    347 ;	testcoop.c:44: bufferFull = 1;
      000018 75 3C 01         [24]  348 	mov	_bufferFull,#0x01
                                    349 ;	testcoop.c:45: currentChar = (currentChar == 'Z') ? 'A' : currentChar + 1;
      00001B 74 5A            [12]  350 	mov	a,#0x5a
      00001D B5 3B 04         [24]  351 	cjne	a,_currentChar,00109$
      000020 7E 41            [12]  352 	mov	r6,#0x41
      000022 80 08            [24]  353 	sjmp	00110$
      000024                        354 00109$:
      000024 AD 3B            [24]  355 	mov	r5,_currentChar
      000026 0D               [12]  356 	inc	r5
      000027 ED               [12]  357 	mov	a,r5
      000028 FE               [12]  358 	mov	r6,a
      000029 33               [12]  359 	rlc	a
      00002A 95 E0            [12]  360 	subb	a,acc
      00002C                        361 00110$:
      00002C 8E 3B            [24]  362 	mov	_currentChar,r6
                                    363 ;	testcoop.c:47: }
      00002E 80 DC            [24]  364 	sjmp	00101$
                                    365 ;------------------------------------------------------------
                                    366 ;Allocation info for local variables in function 'Consumer'
                                    367 ;------------------------------------------------------------
                                    368 ;	testcoop.c:54: void Consumer(void)
                                    369 ;	-----------------------------------------
                                    370 ;	 function Consumer
                                    371 ;	-----------------------------------------
      000030                        372 _Consumer:
                                    373 ;	testcoop.c:60: TMOD = 0x20;
      000030 75 89 20         [24]  374 	mov	_TMOD,#0x20
                                    375 ;	testcoop.c:61: TH1 = -6;
      000033 75 8D FA         [24]  376 	mov	_TH1,#0xfa
                                    377 ;	testcoop.c:62: SCON = 0x50;
      000036 75 98 50         [24]  378 	mov	_SCON,#0x50
                                    379 ;	testcoop.c:63: TR1 = 1;
                                    380 ;	assignBit
      000039 D2 8E            [12]  381 	setb	_TR1
                                    382 ;	testcoop.c:69: while (!bufferFull){
      00003B                        383 00101$:
      00003B E5 3C            [12]  384 	mov	a,_bufferFull
      00003D 70 05            [24]  385 	jnz	00103$
                                    386 ;	testcoop.c:70: ThreadYield();
      00003F 12 01 0C         [24]  387 	lcall	_ThreadYield
      000042 80 F7            [24]  388 	sjmp	00101$
      000044                        389 00103$:
                                    390 ;	testcoop.c:78: SBUF = buffer;
      000044 85 3A 99         [24]  391 	mov	_SBUF,_buffer
                                    392 ;	testcoop.c:79: bufferFull = 0;
      000047 75 3C 00         [24]  393 	mov	_bufferFull,#0x00
                                    394 ;	testcoop.c:80: while (!TI){
      00004A                        395 00104$:
      00004A 20 99 05         [24]  396 	jb	_TI,00106$
                                    397 ;	testcoop.c:81: ThreadYield();
      00004D 12 01 0C         [24]  398 	lcall	_ThreadYield
      000050 80 F8            [24]  399 	sjmp	00104$
      000052                        400 00106$:
                                    401 ;	testcoop.c:83: TI = 0;
                                    402 ;	assignBit
      000052 C2 99            [12]  403 	clr	_TI
                                    404 ;	testcoop.c:85: }
      000054 80 E5            [24]  405 	sjmp	00101$
                                    406 ;------------------------------------------------------------
                                    407 ;Allocation info for local variables in function 'main'
                                    408 ;------------------------------------------------------------
                                    409 ;	testcoop.c:92: void main(void)
                                    410 ;	-----------------------------------------
                                    411 ;	 function main
                                    412 ;	-----------------------------------------
      000056                        413 _main:
                                    414 ;	testcoop.c:98: bufferFull = 0;
      000056 75 3C 00         [24]  415 	mov	_bufferFull,#0x00
                                    416 ;	testcoop.c:105: ThreadCreate(Producer);
      000059 90 00 09         [24]  417 	mov	dptr,#_Producer
      00005C 12 00 87         [24]  418 	lcall	_ThreadCreate
                                    419 ;	testcoop.c:106: Consumer();
                                    420 ;	testcoop.c:107: }
      00005F 02 00 30         [24]  421 	ljmp	_Consumer
                                    422 ;------------------------------------------------------------
                                    423 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    424 ;------------------------------------------------------------
                                    425 ;	testcoop.c:109: void _sdcc_gsinit_startup(void)
                                    426 ;	-----------------------------------------
                                    427 ;	 function _sdcc_gsinit_startup
                                    428 ;	-----------------------------------------
      000062                        429 __sdcc_gsinit_startup:
                                    430 ;	testcoop.c:113: __endasm;
      000062 02 00 69         [24]  431 	LJMP	_Bootstrap
                                    432 ;	testcoop.c:114: }
      000065 22               [24]  433 	ret
                                    434 ;------------------------------------------------------------
                                    435 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    436 ;------------------------------------------------------------
                                    437 ;	testcoop.c:116: void _mcs51_genRAMCLEAR(void) {}
                                    438 ;	-----------------------------------------
                                    439 ;	 function _mcs51_genRAMCLEAR
                                    440 ;	-----------------------------------------
      000066                        441 __mcs51_genRAMCLEAR:
      000066 22               [24]  442 	ret
                                    443 ;------------------------------------------------------------
                                    444 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    445 ;------------------------------------------------------------
                                    446 ;	testcoop.c:117: void _mcs51_genXINIT(void) {}
                                    447 ;	-----------------------------------------
                                    448 ;	 function _mcs51_genXINIT
                                    449 ;	-----------------------------------------
      000067                        450 __mcs51_genXINIT:
      000067 22               [24]  451 	ret
                                    452 ;------------------------------------------------------------
                                    453 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    454 ;------------------------------------------------------------
                                    455 ;	testcoop.c:118: void _mcs51_genXRAMCLEAR(void) {}
                                    456 ;	-----------------------------------------
                                    457 ;	 function _mcs51_genXRAMCLEAR
                                    458 ;	-----------------------------------------
      000068                        459 __mcs51_genXRAMCLEAR:
      000068 22               [24]  460 	ret
                                    461 	.area CSEG    (CODE)
                                    462 	.area CONST   (CODE)
                                    463 	.area XINIT   (CODE)
                                    464 	.area CABS    (ABS,CODE)
