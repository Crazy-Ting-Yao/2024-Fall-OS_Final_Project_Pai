                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module testlcd
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
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ButtonToChar
                                     21 	.globl _AnyButtonPressed
                                     22 	.globl _LCD_ready
                                     23 	.globl _LCD_write_char
                                     24 	.globl _LCD_Init
                                     25 	.globl _AnyKeyPressed
                                     26 	.globl _KeyToChar
                                     27 	.globl _Init_Keypad
                                     28 	.globl _ThreadCreate
                                     29 	.globl _CY
                                     30 	.globl _AC
                                     31 	.globl _F0
                                     32 	.globl _RS1
                                     33 	.globl _RS0
                                     34 	.globl _OV
                                     35 	.globl _F1
                                     36 	.globl _P
                                     37 	.globl _PS
                                     38 	.globl _PT1
                                     39 	.globl _PX1
                                     40 	.globl _PT0
                                     41 	.globl _PX0
                                     42 	.globl _RD
                                     43 	.globl _WR
                                     44 	.globl _T1
                                     45 	.globl _T0
                                     46 	.globl _INT1
                                     47 	.globl _INT0
                                     48 	.globl _TXD
                                     49 	.globl _RXD
                                     50 	.globl _P3_7
                                     51 	.globl _P3_6
                                     52 	.globl _P3_5
                                     53 	.globl _P3_4
                                     54 	.globl _P3_3
                                     55 	.globl _P3_2
                                     56 	.globl _P3_1
                                     57 	.globl _P3_0
                                     58 	.globl _EA
                                     59 	.globl _ES
                                     60 	.globl _ET1
                                     61 	.globl _EX1
                                     62 	.globl _ET0
                                     63 	.globl _EX0
                                     64 	.globl _P2_7
                                     65 	.globl _P2_6
                                     66 	.globl _P2_5
                                     67 	.globl _P2_4
                                     68 	.globl _P2_3
                                     69 	.globl _P2_2
                                     70 	.globl _P2_1
                                     71 	.globl _P2_0
                                     72 	.globl _SM0
                                     73 	.globl _SM1
                                     74 	.globl _SM2
                                     75 	.globl _REN
                                     76 	.globl _TB8
                                     77 	.globl _RB8
                                     78 	.globl _TI
                                     79 	.globl _RI
                                     80 	.globl _P1_7
                                     81 	.globl _P1_6
                                     82 	.globl _P1_5
                                     83 	.globl _P1_4
                                     84 	.globl _P1_3
                                     85 	.globl _P1_2
                                     86 	.globl _P1_1
                                     87 	.globl _P1_0
                                     88 	.globl _TF1
                                     89 	.globl _TR1
                                     90 	.globl _TF0
                                     91 	.globl _TR0
                                     92 	.globl _IE1
                                     93 	.globl _IT1
                                     94 	.globl _IE0
                                     95 	.globl _IT0
                                     96 	.globl _P0_7
                                     97 	.globl _P0_6
                                     98 	.globl _P0_5
                                     99 	.globl _P0_4
                                    100 	.globl _P0_3
                                    101 	.globl _P0_2
                                    102 	.globl _P0_1
                                    103 	.globl _P0_0
                                    104 	.globl _B
                                    105 	.globl _ACC
                                    106 	.globl _PSW
                                    107 	.globl _IP
                                    108 	.globl _P3
                                    109 	.globl _IE
                                    110 	.globl _P2
                                    111 	.globl _SBUF
                                    112 	.globl _SCON
                                    113 	.globl _P1
                                    114 	.globl _TH1
                                    115 	.globl _TH0
                                    116 	.globl _TL1
                                    117 	.globl _TL0
                                    118 	.globl _TMOD
                                    119 	.globl _TCON
                                    120 	.globl _PCON
                                    121 	.globl _DPH
                                    122 	.globl _DPL
                                    123 	.globl _SP
                                    124 	.globl _P0
                                    125 	.globl _pop
                                    126 	.globl _currentKey
                                    127 	.globl _consumer_ptr
                                    128 	.globl _producer_ptr
                                    129 	.globl _full
                                    130 	.globl _empty
                                    131 	.globl _mutex
                                    132 	.globl _currentButton
                                    133 	.globl _buffer
                                    134 ;--------------------------------------------------------
                                    135 ; special function registers
                                    136 ;--------------------------------------------------------
                                    137 	.area RSEG    (ABS,DATA)
      000000                        138 	.org 0x0000
                           000080   139 _P0	=	0x0080
                           000081   140 _SP	=	0x0081
                           000082   141 _DPL	=	0x0082
                           000083   142 _DPH	=	0x0083
                           000087   143 _PCON	=	0x0087
                           000088   144 _TCON	=	0x0088
                           000089   145 _TMOD	=	0x0089
                           00008A   146 _TL0	=	0x008a
                           00008B   147 _TL1	=	0x008b
                           00008C   148 _TH0	=	0x008c
                           00008D   149 _TH1	=	0x008d
                           000090   150 _P1	=	0x0090
                           000098   151 _SCON	=	0x0098
                           000099   152 _SBUF	=	0x0099
                           0000A0   153 _P2	=	0x00a0
                           0000A8   154 _IE	=	0x00a8
                           0000B0   155 _P3	=	0x00b0
                           0000B8   156 _IP	=	0x00b8
                           0000D0   157 _PSW	=	0x00d0
                           0000E0   158 _ACC	=	0x00e0
                           0000F0   159 _B	=	0x00f0
                                    160 ;--------------------------------------------------------
                                    161 ; special function bits
                                    162 ;--------------------------------------------------------
                                    163 	.area RSEG    (ABS,DATA)
      000000                        164 	.org 0x0000
                           000080   165 _P0_0	=	0x0080
                           000081   166 _P0_1	=	0x0081
                           000082   167 _P0_2	=	0x0082
                           000083   168 _P0_3	=	0x0083
                           000084   169 _P0_4	=	0x0084
                           000085   170 _P0_5	=	0x0085
                           000086   171 _P0_6	=	0x0086
                           000087   172 _P0_7	=	0x0087
                           000088   173 _IT0	=	0x0088
                           000089   174 _IE0	=	0x0089
                           00008A   175 _IT1	=	0x008a
                           00008B   176 _IE1	=	0x008b
                           00008C   177 _TR0	=	0x008c
                           00008D   178 _TF0	=	0x008d
                           00008E   179 _TR1	=	0x008e
                           00008F   180 _TF1	=	0x008f
                           000090   181 _P1_0	=	0x0090
                           000091   182 _P1_1	=	0x0091
                           000092   183 _P1_2	=	0x0092
                           000093   184 _P1_3	=	0x0093
                           000094   185 _P1_4	=	0x0094
                           000095   186 _P1_5	=	0x0095
                           000096   187 _P1_6	=	0x0096
                           000097   188 _P1_7	=	0x0097
                           000098   189 _RI	=	0x0098
                           000099   190 _TI	=	0x0099
                           00009A   191 _RB8	=	0x009a
                           00009B   192 _TB8	=	0x009b
                           00009C   193 _REN	=	0x009c
                           00009D   194 _SM2	=	0x009d
                           00009E   195 _SM1	=	0x009e
                           00009F   196 _SM0	=	0x009f
                           0000A0   197 _P2_0	=	0x00a0
                           0000A1   198 _P2_1	=	0x00a1
                           0000A2   199 _P2_2	=	0x00a2
                           0000A3   200 _P2_3	=	0x00a3
                           0000A4   201 _P2_4	=	0x00a4
                           0000A5   202 _P2_5	=	0x00a5
                           0000A6   203 _P2_6	=	0x00a6
                           0000A7   204 _P2_7	=	0x00a7
                           0000A8   205 _EX0	=	0x00a8
                           0000A9   206 _ET0	=	0x00a9
                           0000AA   207 _EX1	=	0x00aa
                           0000AB   208 _ET1	=	0x00ab
                           0000AC   209 _ES	=	0x00ac
                           0000AF   210 _EA	=	0x00af
                           0000B0   211 _P3_0	=	0x00b0
                           0000B1   212 _P3_1	=	0x00b1
                           0000B2   213 _P3_2	=	0x00b2
                           0000B3   214 _P3_3	=	0x00b3
                           0000B4   215 _P3_4	=	0x00b4
                           0000B5   216 _P3_5	=	0x00b5
                           0000B6   217 _P3_6	=	0x00b6
                           0000B7   218 _P3_7	=	0x00b7
                           0000B0   219 _RXD	=	0x00b0
                           0000B1   220 _TXD	=	0x00b1
                           0000B2   221 _INT0	=	0x00b2
                           0000B3   222 _INT1	=	0x00b3
                           0000B4   223 _T0	=	0x00b4
                           0000B5   224 _T1	=	0x00b5
                           0000B6   225 _WR	=	0x00b6
                           0000B7   226 _RD	=	0x00b7
                           0000B8   227 _PX0	=	0x00b8
                           0000B9   228 _PT0	=	0x00b9
                           0000BA   229 _PX1	=	0x00ba
                           0000BB   230 _PT1	=	0x00bb
                           0000BC   231 _PS	=	0x00bc
                           0000D0   232 _P	=	0x00d0
                           0000D1   233 _F1	=	0x00d1
                           0000D2   234 _OV	=	0x00d2
                           0000D3   235 _RS0	=	0x00d3
                           0000D4   236 _RS1	=	0x00d4
                           0000D5   237 _F0	=	0x00d5
                           0000D6   238 _AC	=	0x00d6
                           0000D7   239 _CY	=	0x00d7
                                    240 ;--------------------------------------------------------
                                    241 ; overlayable register banks
                                    242 ;--------------------------------------------------------
                                    243 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        244 	.ds 8
                                    245 ;--------------------------------------------------------
                                    246 ; internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area DSEG    (DATA)
                           000030   249 _buffer	=	0x0030
                           000033   250 _currentButton	=	0x0033
                           000034   251 _mutex	=	0x0034
                           000035   252 _empty	=	0x0035
                           000036   253 _full	=	0x0036
                           000037   254 _producer_ptr	=	0x0037
                           000038   255 _consumer_ptr	=	0x0038
                           000039   256 _currentKey	=	0x0039
                           00003A   257 _pop	=	0x003a
                                    258 ;--------------------------------------------------------
                                    259 ; overlayable items in internal ram
                                    260 ;--------------------------------------------------------
                                    261 ;--------------------------------------------------------
                                    262 ; Stack segment in internal ram
                                    263 ;--------------------------------------------------------
                                    264 	.area SSEG
      000021                        265 __start__stack:
      000021                        266 	.ds	1
                                    267 
                                    268 ;--------------------------------------------------------
                                    269 ; indirectly addressable internal ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area ISEG    (DATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute internal ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area IABS    (ABS,DATA)
                                    276 	.area IABS    (ABS,DATA)
                                    277 ;--------------------------------------------------------
                                    278 ; bit data
                                    279 ;--------------------------------------------------------
                                    280 	.area BSEG    (BIT)
      000000                        281 _Producer1_sloc0_1_0:
      000000                        282 	.ds 1
      000001                        283 _Producer2_sloc0_1_0:
      000001                        284 	.ds 1
                                    285 ;--------------------------------------------------------
                                    286 ; paged external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area PSEG    (PAG,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; uninitialized external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XSEG    (XDATA)
                                    293 ;--------------------------------------------------------
                                    294 ; absolute external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area XABS    (ABS,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; initialized external ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XISEG   (XDATA)
                                    301 	.area HOME    (CODE)
                                    302 	.area GSINIT0 (CODE)
                                    303 	.area GSINIT1 (CODE)
                                    304 	.area GSINIT2 (CODE)
                                    305 	.area GSINIT3 (CODE)
                                    306 	.area GSINIT4 (CODE)
                                    307 	.area GSINIT5 (CODE)
                                    308 	.area GSINIT  (CODE)
                                    309 	.area GSFINAL (CODE)
                                    310 	.area CSEG    (CODE)
                                    311 ;--------------------------------------------------------
                                    312 ; interrupt vector
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
      000000                        315 __interrupt_vect:
      000000 02 01 1F         [24]  316 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  317 	reti
      000004                        318 	.ds	7
      00000B 02 01 26         [24]  319 	ljmp	_timer0_ISR
                                    320 ;--------------------------------------------------------
                                    321 ; global & static initialisations
                                    322 ;--------------------------------------------------------
                                    323 	.area HOME    (CODE)
                                    324 	.area GSINIT  (CODE)
                                    325 	.area GSFINAL (CODE)
                                    326 	.area GSINIT  (CODE)
                                    327 	.globl __sdcc_gsinit_startup
                                    328 	.globl __sdcc_program_startup
                                    329 	.globl __start__stack
                                    330 	.globl __mcs51_genXINIT
                                    331 	.globl __mcs51_genXRAMCLEAR
                                    332 	.globl __mcs51_genRAMCLEAR
                                    333 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  334 	ljmp	__sdcc_program_startup
                                    335 ;--------------------------------------------------------
                                    336 ; Home
                                    337 ;--------------------------------------------------------
                                    338 	.area HOME    (CODE)
                                    339 	.area HOME    (CODE)
      00000E                        340 __sdcc_program_startup:
      00000E 02 00 FE         [24]  341 	ljmp	_main
                                    342 ;	return from main will return to caller
                                    343 ;--------------------------------------------------------
                                    344 ; code
                                    345 ;--------------------------------------------------------
                                    346 	.area CSEG    (CODE)
                                    347 ;------------------------------------------------------------
                                    348 ;Allocation info for local variables in function 'Producer1'
                                    349 ;------------------------------------------------------------
                                    350 ;	testlcd.c:34: void Producer1(void)
                                    351 ;	-----------------------------------------
                                    352 ;	 function Producer1
                                    353 ;	-----------------------------------------
      000014                        354 _Producer1:
                           000007   355 	ar7 = 0x07
                           000006   356 	ar6 = 0x06
                           000005   357 	ar5 = 0x05
                           000004   358 	ar4 = 0x04
                           000003   359 	ar3 = 0x03
                           000002   360 	ar2 = 0x02
                           000001   361 	ar1 = 0x01
                           000000   362 	ar0 = 0x00
                                    363 ;	testlcd.c:45: while(!AnyButtonPressed());
      000014                        364 00101$:
      000014 12 03 C7         [24]  365 	lcall	_AnyButtonPressed
      000017 E5 82            [12]  366 	mov	a, dpl
      000019 60 F9            [24]  367 	jz	00101$
                                    368 ;	testlcd.c:48: }
      00001B D2 00            [12]  369 	setb	_Producer1_sloc0_1_0
      00001D 10 AF 02         [24]  370 	jbc	ea,00145$
      000020 C2 00            [12]  371 	clr	_Producer1_sloc0_1_0
      000022                        372 00145$:
                                    373 ;	testlcd.c:47: currentButton = ButtonToChar();
      000022 12 03 D9         [24]  374 	lcall	_ButtonToChar
      000025 85 82 33         [24]  375 	mov	_currentButton,dpl
      000028 A2 00            [12]  376 	mov	c,_Producer1_sloc0_1_0
      00002A 92 AF            [24]  377 	mov	ea,c
                                    378 ;	testlcd.c:49: SemaphoreWaitBody(empty,  L(__COUNTER__));
      00002C                        379 0$:
      00002C E5 35            [12]  380 	MOV A, _empty 
      00002E 60 FC            [24]  381 	JZ 0$ 
      000030 20 E7 F9         [24]  382 	JB ACC.7, 0$ 
      000033 15 35            [12]  383 	dec _empty 
                                    384 ;	testlcd.c:50: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000035                        385 1$:
      000035 E5 34            [12]  386 	MOV A, _mutex 
      000037 60 FC            [24]  387 	JZ 1$ 
      000039 20 E7 F9         [24]  388 	JB ACC.7, 1$ 
      00003C 15 34            [12]  389 	dec _mutex 
                                    390 ;	testlcd.c:51: buffer[producer_ptr] = currentButton;
      00003E E5 37            [12]  391 	mov	a,_producer_ptr
      000040 24 30            [12]  392 	add	a, #_buffer
      000042 F8               [12]  393 	mov	r0,a
      000043 A6 33            [24]  394 	mov	@r0,_currentButton
                                    395 ;	testlcd.c:52: producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
      000045 74 02            [12]  396 	mov	a,#0x02
      000047 B5 37 06         [24]  397 	cjne	a,_producer_ptr,00112$
      00004A 7E 00            [12]  398 	mov	r6,#0x00
      00004C 7F 00            [12]  399 	mov	r7,#0x00
      00004E 80 09            [24]  400 	sjmp	00113$
      000050                        401 00112$:
      000050 AD 37            [24]  402 	mov	r5,_producer_ptr
      000052 0D               [12]  403 	inc	r5
      000053 ED               [12]  404 	mov	a,r5
      000054 FE               [12]  405 	mov	r6,a
      000055 33               [12]  406 	rlc	a
      000056 95 E0            [12]  407 	subb	a,acc
      000058 FF               [12]  408 	mov	r7,a
      000059                        409 00113$:
      000059 8E 37            [24]  410 	mov	_producer_ptr,r6
                                    411 ;	testlcd.c:53: SemaphoreSignal(mutex);
      00005B 05 34            [12]  412 	INC _mutex 
                                    413 ;	testlcd.c:54: SemaphoreSignal(full);
      00005D 05 36            [12]  414 	INC _full 
                                    415 ;	testlcd.c:55: while (AnyButtonPressed());
      00005F                        416 00104$:
      00005F 12 03 C7         [24]  417 	lcall	_AnyButtonPressed
      000062 E5 82            [12]  418 	mov	a, dpl
      000064 60 AE            [24]  419 	jz	00101$
                                    420 ;	testlcd.c:57: }
      000066 80 F7            [24]  421 	sjmp	00104$
                                    422 ;------------------------------------------------------------
                                    423 ;Allocation info for local variables in function 'Producer2'
                                    424 ;------------------------------------------------------------
                                    425 ;	testlcd.c:59: void Producer2(void)
                                    426 ;	-----------------------------------------
                                    427 ;	 function Producer2
                                    428 ;	-----------------------------------------
      000068                        429 _Producer2:
                                    430 ;	testlcd.c:70: while (!AnyKeyPressed());
      000068                        431 00101$:
      000068 12 04 6B         [24]  432 	lcall	_AnyKeyPressed
      00006B E5 82            [12]  433 	mov	a, dpl
      00006D 60 F9            [24]  434 	jz	00101$
                                    435 ;	testlcd.c:73: }
      00006F D2 01            [12]  436 	setb	_Producer2_sloc0_1_0
      000071 10 AF 02         [24]  437 	jbc	ea,00145$
      000074 C2 01            [12]  438 	clr	_Producer2_sloc0_1_0
      000076                        439 00145$:
                                    440 ;	testlcd.c:72: currentKey = KeyToChar();
      000076 12 04 78         [24]  441 	lcall	_KeyToChar
      000079 85 82 39         [24]  442 	mov	_currentKey,dpl
      00007C A2 01            [12]  443 	mov	c,_Producer2_sloc0_1_0
      00007E 92 AF            [24]  444 	mov	ea,c
                                    445 ;	testlcd.c:74: SemaphoreWaitBody(empty,  L(__COUNTER__));
      000080                        446 2$:
      000080 E5 35            [12]  447 	MOV A, _empty 
      000082 60 FC            [24]  448 	JZ 2$ 
      000084 20 E7 F9         [24]  449 	JB ACC.7, 2$ 
      000087 15 35            [12]  450 	dec _empty 
                                    451 ;	testlcd.c:75: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000089                        452 3$:
      000089 E5 34            [12]  453 	MOV A, _mutex 
      00008B 60 FC            [24]  454 	JZ 3$ 
      00008D 20 E7 F9         [24]  455 	JB ACC.7, 3$ 
      000090 15 34            [12]  456 	dec _mutex 
                                    457 ;	testlcd.c:76: buffer[producer_ptr] = currentKey;
      000092 E5 37            [12]  458 	mov	a,_producer_ptr
      000094 24 30            [12]  459 	add	a, #_buffer
      000096 F8               [12]  460 	mov	r0,a
      000097 A6 39            [24]  461 	mov	@r0,_currentKey
                                    462 ;	testlcd.c:77: producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
      000099 74 02            [12]  463 	mov	a,#0x02
      00009B B5 37 06         [24]  464 	cjne	a,_producer_ptr,00112$
      00009E 7E 00            [12]  465 	mov	r6,#0x00
      0000A0 7F 00            [12]  466 	mov	r7,#0x00
      0000A2 80 09            [24]  467 	sjmp	00113$
      0000A4                        468 00112$:
      0000A4 AD 37            [24]  469 	mov	r5,_producer_ptr
      0000A6 0D               [12]  470 	inc	r5
      0000A7 ED               [12]  471 	mov	a,r5
      0000A8 FE               [12]  472 	mov	r6,a
      0000A9 33               [12]  473 	rlc	a
      0000AA 95 E0            [12]  474 	subb	a,acc
      0000AC FF               [12]  475 	mov	r7,a
      0000AD                        476 00113$:
      0000AD 8E 37            [24]  477 	mov	_producer_ptr,r6
                                    478 ;	testlcd.c:78: SemaphoreSignal(mutex);
      0000AF 05 34            [12]  479 	INC _mutex 
                                    480 ;	testlcd.c:79: SemaphoreSignal(full);
      0000B1 05 36            [12]  481 	INC _full 
                                    482 ;	testlcd.c:80: while (AnyKeyPressed());
      0000B3                        483 00104$:
      0000B3 12 04 6B         [24]  484 	lcall	_AnyKeyPressed
      0000B6 E5 82            [12]  485 	mov	a, dpl
      0000B8 60 AE            [24]  486 	jz	00101$
                                    487 ;	testlcd.c:82: }
      0000BA 80 F7            [24]  488 	sjmp	00104$
                                    489 ;------------------------------------------------------------
                                    490 ;Allocation info for local variables in function 'Consumer'
                                    491 ;------------------------------------------------------------
                                    492 ;	testlcd.c:89: void Consumer(void)
                                    493 ;	-----------------------------------------
                                    494 ;	 function Consumer
                                    495 ;	-----------------------------------------
      0000BC                        496 _Consumer:
                                    497 ;	testlcd.c:95: consumer_ptr = 0;
      0000BC 75 38 00         [24]  498 	mov	_consumer_ptr,#0x00
                                    499 ;	testlcd.c:96: while (1){
      0000BF                        500 00105$:
                                    501 ;	testlcd.c:101: SemaphoreWaitBody(full,  L(__COUNTER__));
      0000BF                        502 4$:
      0000BF E5 36            [12]  503 	MOV A, _full 
      0000C1 60 FC            [24]  504 	JZ 4$ 
      0000C3 20 E7 F9         [24]  505 	JB ACC.7, 4$ 
      0000C6 15 36            [12]  506 	dec _full 
                                    507 ;	testlcd.c:102: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      0000C8                        508 5$:
      0000C8 E5 34            [12]  509 	MOV A, _mutex 
      0000CA 60 FC            [24]  510 	JZ 5$ 
      0000CC 20 E7 F9         [24]  511 	JB ACC.7, 5$ 
      0000CF 15 34            [12]  512 	dec _mutex 
                                    513 ;	testlcd.c:103: pop = buffer[consumer_ptr];
      0000D1 E5 38            [12]  514 	mov	a,_consumer_ptr
      0000D3 24 30            [12]  515 	add	a, #_buffer
      0000D5 F9               [12]  516 	mov	r1,a
      0000D6 87 3A            [24]  517 	mov	_pop,@r1
                                    518 ;	testlcd.c:104: SemaphoreSignal(mutex);
      0000D8 05 34            [12]  519 	INC _mutex 
                                    520 ;	testlcd.c:105: SemaphoreSignal(empty);
      0000DA 05 35            [12]  521 	INC _empty 
                                    522 ;	testlcd.c:106: consumer_ptr = (consumer_ptr == 2) ? 0 : consumer_ptr + 1;
      0000DC 74 02            [12]  523 	mov	a,#0x02
      0000DE B5 38 04         [24]  524 	cjne	a,_consumer_ptr,00109$
      0000E1 7E 00            [12]  525 	mov	r6,#0x00
      0000E3 80 08            [24]  526 	sjmp	00110$
      0000E5                        527 00109$:
      0000E5 AD 38            [24]  528 	mov	r5,_consumer_ptr
      0000E7 0D               [12]  529 	inc	r5
      0000E8 ED               [12]  530 	mov	a,r5
      0000E9 FE               [12]  531 	mov	r6,a
      0000EA 33               [12]  532 	rlc	a
      0000EB 95 E0            [12]  533 	subb	a,acc
      0000ED                        534 00110$:
      0000ED 8E 38            [24]  535 	mov	_consumer_ptr,r6
                                    536 ;	testlcd.c:107: LCD_write_char(pop);
      0000EF 85 3A 82         [24]  537 	mov	dpl, _pop
      0000F2 12 03 64         [24]  538 	lcall	_LCD_write_char
                                    539 ;	testlcd.c:108: while (!LCD_ready());
      0000F5                        540 00101$:
      0000F5 12 03 01         [24]  541 	lcall	_LCD_ready
      0000F8 E5 82            [12]  542 	mov	a, dpl
      0000FA 70 C3            [24]  543 	jnz	00105$
                                    544 ;	testlcd.c:110: }
      0000FC 80 F7            [24]  545 	sjmp	00101$
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function 'main'
                                    548 ;------------------------------------------------------------
                                    549 ;	testlcd.c:117: void main(void)
                                    550 ;	-----------------------------------------
                                    551 ;	 function main
                                    552 ;	-----------------------------------------
      0000FE                        553 _main:
                                    554 ;	testlcd.c:123: producer_ptr = 0;
      0000FE 75 37 00         [24]  555 	mov	_producer_ptr,#0x00
                                    556 ;	testlcd.c:124: Init_Keypad();
      000101 12 04 65         [24]  557 	lcall	_Init_Keypad
                                    558 ;	testlcd.c:125: LCD_Init();
      000104 12 03 05         [24]  559 	lcall	_LCD_Init
                                    560 ;	testlcd.c:126: SemaphoreCreate(full, 0);
      000107 75 36 00         [24]  561 	mov	_full,#0x00
                                    562 ;	testlcd.c:127: SemaphoreCreate(mutex, 1);
      00010A 75 34 01         [24]  563 	mov	_mutex,#0x01
                                    564 ;	testlcd.c:128: SemaphoreCreate(empty, 3);
      00010D 75 35 03         [24]  565 	mov	_empty,#0x03
                                    566 ;	testlcd.c:135: ThreadCreate(Consumer);
      000110 90 00 BC         [24]  567 	mov	dptr,#_Consumer
      000113 12 01 DC         [24]  568 	lcall	_ThreadCreate
                                    569 ;	testlcd.c:136: ThreadCreate(Producer2);
      000116 90 00 68         [24]  570 	mov	dptr,#_Producer2
      000119 12 01 DC         [24]  571 	lcall	_ThreadCreate
                                    572 ;	testlcd.c:137: Producer1();
                                    573 ;	testlcd.c:138: }
      00011C 02 00 14         [24]  574 	ljmp	_Producer1
                                    575 ;------------------------------------------------------------
                                    576 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    577 ;------------------------------------------------------------
                                    578 ;	testlcd.c:140: void _sdcc_gsinit_startup(void)
                                    579 ;	-----------------------------------------
                                    580 ;	 function _sdcc_gsinit_startup
                                    581 ;	-----------------------------------------
      00011F                        582 __sdcc_gsinit_startup:
                                    583 ;	testlcd.c:144: __endasm;
      00011F 02 01 2A         [24]  584 	LJMP	_Bootstrap
                                    585 ;	testlcd.c:145: }
      000122 22               [24]  586 	ret
                                    587 ;------------------------------------------------------------
                                    588 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    589 ;------------------------------------------------------------
                                    590 ;	testlcd.c:147: void _mcs51_genRAMCLEAR(void) {}
                                    591 ;	-----------------------------------------
                                    592 ;	 function _mcs51_genRAMCLEAR
                                    593 ;	-----------------------------------------
      000123                        594 __mcs51_genRAMCLEAR:
      000123 22               [24]  595 	ret
                                    596 ;------------------------------------------------------------
                                    597 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    598 ;------------------------------------------------------------
                                    599 ;	testlcd.c:148: void _mcs51_genXINIT(void) {}
                                    600 ;	-----------------------------------------
                                    601 ;	 function _mcs51_genXINIT
                                    602 ;	-----------------------------------------
      000124                        603 __mcs51_genXINIT:
      000124 22               [24]  604 	ret
                                    605 ;------------------------------------------------------------
                                    606 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    607 ;------------------------------------------------------------
                                    608 ;	testlcd.c:149: void _mcs51_genXRAMCLEAR(void) {}
                                    609 ;	-----------------------------------------
                                    610 ;	 function _mcs51_genXRAMCLEAR
                                    611 ;	-----------------------------------------
      000125                        612 __mcs51_genXRAMCLEAR:
      000125 22               [24]  613 	ret
                                    614 ;------------------------------------------------------------
                                    615 ;Allocation info for local variables in function 'timer0_ISR'
                                    616 ;------------------------------------------------------------
                                    617 ;	testlcd.c:150: void timer0_ISR(void) __interrupt(1) {
                                    618 ;	-----------------------------------------
                                    619 ;	 function timer0_ISR
                                    620 ;	-----------------------------------------
      000126                        621 _timer0_ISR:
                                    622 ;	testlcd.c:153: __endasm;
      000126 02 01 53         [24]  623 	ljmp	_myTimer0Handler
                                    624 ;	testlcd.c:154: }
      000129 32               [24]  625 	reti
                                    626 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    627 ;	eliminated unneeded push/pop not_psw
                                    628 ;	eliminated unneeded push/pop dpl
                                    629 ;	eliminated unneeded push/pop dph
                                    630 ;	eliminated unneeded push/pop b
                                    631 ;	eliminated unneeded push/pop acc
                                    632 	.area CSEG    (CODE)
                                    633 	.area CONST   (CODE)
                                    634 	.area XINIT   (CODE)
                                    635 	.area CABS    (ABS,CODE)
