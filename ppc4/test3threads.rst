                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _currentNum
                                    118 	.globl _consumer_ptr
                                    119 	.globl _producer_ptr
                                    120 	.globl _full
                                    121 	.globl _empty
                                    122 	.globl _mutex
                                    123 	.globl _currentChar
                                    124 	.globl _buffer
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           000030   240 _buffer	=	0x0030
                           000033   241 _currentChar	=	0x0033
                           000034   242 _mutex	=	0x0034
                           000035   243 _empty	=	0x0035
                           000036   244 _full	=	0x0036
                           000037   245 _producer_ptr	=	0x0037
                           000038   246 _consumer_ptr	=	0x0038
                           000039   247 _currentNum	=	0x0039
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram
                                    250 ;--------------------------------------------------------
                                    251 ;--------------------------------------------------------
                                    252 ; Stack segment in internal ram
                                    253 ;--------------------------------------------------------
                                    254 	.area SSEG
      000021                        255 __start__stack:
      000021                        256 	.ds	1
                                    257 
                                    258 ;--------------------------------------------------------
                                    259 ; indirectly addressable internal ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area ISEG    (DATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area IABS    (ABS,DATA)
                                    266 	.area IABS    (ABS,DATA)
                                    267 ;--------------------------------------------------------
                                    268 ; bit data
                                    269 ;--------------------------------------------------------
                                    270 	.area BSEG    (BIT)
                                    271 ;--------------------------------------------------------
                                    272 ; paged external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area PSEG    (PAG,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; uninitialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XSEG    (XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; absolute external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XABS    (ABS,XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; initialized external ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XISEG   (XDATA)
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT0 (CODE)
                                    289 	.area GSINIT1 (CODE)
                                    290 	.area GSINIT2 (CODE)
                                    291 	.area GSINIT3 (CODE)
                                    292 	.area GSINIT4 (CODE)
                                    293 	.area GSINIT5 (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area CSEG    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; interrupt vector
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
      000000                        301 __interrupt_vect:
      000000 02 01 15         [24]  302 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  303 	reti
      000004                        304 	.ds	7
      00000B 02 01 1C         [24]  305 	ljmp	_timer0_ISR
                                    306 ;--------------------------------------------------------
                                    307 ; global & static initialisations
                                    308 ;--------------------------------------------------------
                                    309 	.area HOME    (CODE)
                                    310 	.area GSINIT  (CODE)
                                    311 	.area GSFINAL (CODE)
                                    312 	.area GSINIT  (CODE)
                                    313 	.globl __sdcc_gsinit_startup
                                    314 	.globl __sdcc_program_startup
                                    315 	.globl __start__stack
                                    316 	.globl __mcs51_genXINIT
                                    317 	.globl __mcs51_genXRAMCLEAR
                                    318 	.globl __mcs51_genRAMCLEAR
                                    319 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  320 	ljmp	__sdcc_program_startup
                                    321 ;--------------------------------------------------------
                                    322 ; Home
                                    323 ;--------------------------------------------------------
                                    324 	.area HOME    (CODE)
                                    325 	.area HOME    (CODE)
      00000E                        326 __sdcc_program_startup:
      00000E 02 00 FA         [24]  327 	ljmp	_main
                                    328 ;	return from main will return to caller
                                    329 ;--------------------------------------------------------
                                    330 ; code
                                    331 ;--------------------------------------------------------
                                    332 	.area CSEG    (CODE)
                                    333 ;------------------------------------------------------------
                                    334 ;Allocation info for local variables in function 'Producer1'
                                    335 ;------------------------------------------------------------
                                    336 ;	test3threads.c:31: void Producer1(void)
                                    337 ;	-----------------------------------------
                                    338 ;	 function Producer1
                                    339 ;	-----------------------------------------
      000014                        340 _Producer1:
                           000007   341 	ar7 = 0x07
                           000006   342 	ar6 = 0x06
                           000005   343 	ar5 = 0x05
                           000004   344 	ar4 = 0x04
                           000003   345 	ar3 = 0x03
                           000002   346 	ar2 = 0x02
                           000001   347 	ar1 = 0x01
                           000000   348 	ar0 = 0x00
                                    349 ;	test3threads.c:38: currentChar = 'A';
      000014 75 33 41         [24]  350 	mov	_currentChar,#0x41
                                    351 ;	test3threads.c:39: while (1){
      000017                        352 00102$:
                                    353 ;	test3threads.c:43: SemaphoreWaitBody(empty,  L(__COUNTER__));
      000017                        354 0$:
      000017 E5 35            [12]  355 	MOV A, _empty 
      000019 60 FC            [24]  356 	JZ 0$ 
      00001B 20 E7 F9         [24]  357 	JB ACC.7, 0$ 
      00001E 15 35            [12]  358 	dec _empty 
                                    359 ;	test3threads.c:44: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000020                        360 1$:
      000020 E5 34            [12]  361 	MOV A, _mutex 
      000022 60 FC            [24]  362 	JZ 1$ 
      000024 20 E7 F9         [24]  363 	JB ACC.7, 1$ 
      000027 15 34            [12]  364 	dec _mutex 
                                    365 ;	test3threads.c:45: buffer[producer_ptr] = currentChar;
      000029 E5 37            [12]  366 	mov	a,_producer_ptr
      00002B 24 30            [12]  367 	add	a, #_buffer
      00002D F8               [12]  368 	mov	r0,a
      00002E A6 33            [24]  369 	mov	@r0,_currentChar
                                    370 ;	test3threads.c:46: SemaphoreSignal(mutex);
      000030 05 34            [12]  371 	INC _mutex 
                                    372 ;	test3threads.c:47: producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
      000032 74 02            [12]  373 	mov	a,#0x02
      000034 B5 37 06         [24]  374 	cjne	a,_producer_ptr,00106$
      000037 7E 00            [12]  375 	mov	r6,#0x00
      000039 7F 00            [12]  376 	mov	r7,#0x00
      00003B 80 09            [24]  377 	sjmp	00107$
      00003D                        378 00106$:
      00003D AD 37            [24]  379 	mov	r5,_producer_ptr
      00003F 0D               [12]  380 	inc	r5
      000040 ED               [12]  381 	mov	a,r5
      000041 FE               [12]  382 	mov	r6,a
      000042 33               [12]  383 	rlc	a
      000043 95 E0            [12]  384 	subb	a,acc
      000045 FF               [12]  385 	mov	r7,a
      000046                        386 00107$:
      000046 8E 37            [24]  387 	mov	_producer_ptr,r6
                                    388 ;	test3threads.c:48: SemaphoreSignal(full);
      000048 05 36            [12]  389 	INC _full 
                                    390 ;	test3threads.c:49: currentChar = (currentChar == 'Z') ? 'A' : currentChar + 1;
      00004A 74 5A            [12]  391 	mov	a,#0x5a
      00004C B5 33 06         [24]  392 	cjne	a,_currentChar,00108$
      00004F 7E 41            [12]  393 	mov	r6,#0x41
      000051 7F 00            [12]  394 	mov	r7,#0x00
      000053 80 09            [24]  395 	sjmp	00109$
      000055                        396 00108$:
      000055 AD 33            [24]  397 	mov	r5,_currentChar
      000057 0D               [12]  398 	inc	r5
      000058 ED               [12]  399 	mov	a,r5
      000059 FE               [12]  400 	mov	r6,a
      00005A 33               [12]  401 	rlc	a
      00005B 95 E0            [12]  402 	subb	a,acc
      00005D FF               [12]  403 	mov	r7,a
      00005E                        404 00109$:
      00005E 8E 33            [24]  405 	mov	_currentChar,r6
                                    406 ;	test3threads.c:51: }
      000060 80 B5            [24]  407 	sjmp	00102$
                                    408 ;------------------------------------------------------------
                                    409 ;Allocation info for local variables in function 'Producer2'
                                    410 ;------------------------------------------------------------
                                    411 ;	test3threads.c:53: void Producer2(void)
                                    412 ;	-----------------------------------------
                                    413 ;	 function Producer2
                                    414 ;	-----------------------------------------
      000062                        415 _Producer2:
                                    416 ;	test3threads.c:60: currentNum = '0';
      000062 75 39 30         [24]  417 	mov	_currentNum,#0x30
                                    418 ;	test3threads.c:61: while (1){
      000065                        419 00102$:
                                    420 ;	test3threads.c:65: SemaphoreWaitBody(empty,  L(__COUNTER__));
      000065                        421 2$:
      000065 E5 35            [12]  422 	MOV A, _empty 
      000067 60 FC            [24]  423 	JZ 2$ 
      000069 20 E7 F9         [24]  424 	JB ACC.7, 2$ 
      00006C 15 35            [12]  425 	dec _empty 
                                    426 ;	test3threads.c:66: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      00006E                        427 3$:
      00006E E5 34            [12]  428 	MOV A, _mutex 
      000070 60 FC            [24]  429 	JZ 3$ 
      000072 20 E7 F9         [24]  430 	JB ACC.7, 3$ 
      000075 15 34            [12]  431 	dec _mutex 
                                    432 ;	test3threads.c:67: buffer[producer_ptr] = currentNum;
      000077 E5 37            [12]  433 	mov	a,_producer_ptr
      000079 24 30            [12]  434 	add	a, #_buffer
      00007B F8               [12]  435 	mov	r0,a
      00007C A6 39            [24]  436 	mov	@r0,_currentNum
                                    437 ;	test3threads.c:68: SemaphoreSignal(mutex);
      00007E 05 34            [12]  438 	INC _mutex 
                                    439 ;	test3threads.c:69: producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
      000080 74 02            [12]  440 	mov	a,#0x02
      000082 B5 37 06         [24]  441 	cjne	a,_producer_ptr,00106$
      000085 7E 00            [12]  442 	mov	r6,#0x00
      000087 7F 00            [12]  443 	mov	r7,#0x00
      000089 80 09            [24]  444 	sjmp	00107$
      00008B                        445 00106$:
      00008B AD 37            [24]  446 	mov	r5,_producer_ptr
      00008D 0D               [12]  447 	inc	r5
      00008E ED               [12]  448 	mov	a,r5
      00008F FE               [12]  449 	mov	r6,a
      000090 33               [12]  450 	rlc	a
      000091 95 E0            [12]  451 	subb	a,acc
      000093 FF               [12]  452 	mov	r7,a
      000094                        453 00107$:
      000094 8E 37            [24]  454 	mov	_producer_ptr,r6
                                    455 ;	test3threads.c:70: SemaphoreSignal(full);
      000096 05 36            [12]  456 	INC _full 
                                    457 ;	test3threads.c:71: currentNum = (currentNum == '9') ? '0' : currentNum + 1;
      000098 74 39            [12]  458 	mov	a,#0x39
      00009A B5 39 06         [24]  459 	cjne	a,_currentNum,00108$
      00009D 7E 30            [12]  460 	mov	r6,#0x30
      00009F 7F 00            [12]  461 	mov	r7,#0x00
      0000A1 80 09            [24]  462 	sjmp	00109$
      0000A3                        463 00108$:
      0000A3 AD 39            [24]  464 	mov	r5,_currentNum
      0000A5 0D               [12]  465 	inc	r5
      0000A6 ED               [12]  466 	mov	a,r5
      0000A7 FE               [12]  467 	mov	r6,a
      0000A8 33               [12]  468 	rlc	a
      0000A9 95 E0            [12]  469 	subb	a,acc
      0000AB FF               [12]  470 	mov	r7,a
      0000AC                        471 00109$:
      0000AC 8E 39            [24]  472 	mov	_currentNum,r6
                                    473 ;	test3threads.c:73: }
      0000AE 80 B5            [24]  474 	sjmp	00102$
                                    475 ;------------------------------------------------------------
                                    476 ;Allocation info for local variables in function 'Consumer'
                                    477 ;------------------------------------------------------------
                                    478 ;	test3threads.c:80: void Consumer(void)
                                    479 ;	-----------------------------------------
                                    480 ;	 function Consumer
                                    481 ;	-----------------------------------------
      0000B0                        482 _Consumer:
                                    483 ;	test3threads.c:86: EA = 0;
                                    484 ;	assignBit
      0000B0 C2 AF            [12]  485 	clr	_EA
                                    486 ;	test3threads.c:87: TMOD |= 0x20;
      0000B2 43 89 20         [24]  487 	orl	_TMOD,#0x20
                                    488 ;	test3threads.c:88: TH1 = -6;
      0000B5 75 8D FA         [24]  489 	mov	_TH1,#0xfa
                                    490 ;	test3threads.c:89: SCON = 0x50;
      0000B8 75 98 50         [24]  491 	mov	_SCON,#0x50
                                    492 ;	test3threads.c:90: TR1 = 1;
                                    493 ;	assignBit
      0000BB D2 8E            [12]  494 	setb	_TR1
                                    495 ;	test3threads.c:91: EA = 1;
                                    496 ;	assignBit
      0000BD D2 AF            [12]  497 	setb	_EA
                                    498 ;	test3threads.c:92: consumer_ptr = 0;
      0000BF 75 38 00         [24]  499 	mov	_consumer_ptr,#0x00
                                    500 ;	test3threads.c:93: while (1){
      0000C2                        501 00105$:
                                    502 ;	test3threads.c:98: SemaphoreWaitBody(full,  L(__COUNTER__));
      0000C2                        503 4$:
      0000C2 E5 36            [12]  504 	MOV A, _full 
      0000C4 60 FC            [24]  505 	JZ 4$ 
      0000C6 20 E7 F9         [24]  506 	JB ACC.7, 4$ 
      0000C9 15 36            [12]  507 	dec _full 
                                    508 ;	test3threads.c:99: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      0000CB                        509 5$:
      0000CB E5 34            [12]  510 	MOV A, _mutex 
      0000CD 60 FC            [24]  511 	JZ 5$ 
      0000CF 20 E7 F9         [24]  512 	JB ACC.7, 5$ 
      0000D2 15 34            [12]  513 	dec _mutex 
                                    514 ;	test3threads.c:106: SBUF = buffer[consumer_ptr];
      0000D4 E5 38            [12]  515 	mov	a,_consumer_ptr
      0000D6 24 30            [12]  516 	add	a, #_buffer
      0000D8 F9               [12]  517 	mov	r1,a
      0000D9 87 99            [24]  518 	mov	_SBUF,@r1
                                    519 ;	test3threads.c:107: SemaphoreSignal(mutex);
      0000DB 05 34            [12]  520 	INC _mutex 
                                    521 ;	test3threads.c:108: consumer_ptr = (consumer_ptr == 2) ? 0 : consumer_ptr + 1;
      0000DD 74 02            [12]  522 	mov	a,#0x02
      0000DF B5 38 06         [24]  523 	cjne	a,_consumer_ptr,00109$
      0000E2 7E 00            [12]  524 	mov	r6,#0x00
      0000E4 7F 00            [12]  525 	mov	r7,#0x00
      0000E6 80 09            [24]  526 	sjmp	00110$
      0000E8                        527 00109$:
      0000E8 AD 38            [24]  528 	mov	r5,_consumer_ptr
      0000EA 0D               [12]  529 	inc	r5
      0000EB ED               [12]  530 	mov	a,r5
      0000EC FE               [12]  531 	mov	r6,a
      0000ED 33               [12]  532 	rlc	a
      0000EE 95 E0            [12]  533 	subb	a,acc
      0000F0 FF               [12]  534 	mov	r7,a
      0000F1                        535 00110$:
      0000F1 8E 38            [24]  536 	mov	_consumer_ptr,r6
                                    537 ;	test3threads.c:109: SemaphoreSignal(empty);
      0000F3 05 35            [12]  538 	INC _empty 
                                    539 ;	test3threads.c:110: while (!TI);
      0000F5                        540 00101$:
                                    541 ;	test3threads.c:111: TI = 0;
                                    542 ;	assignBit
      0000F5 10 99 CA         [24]  543 	jbc	_TI,00105$
                                    544 ;	test3threads.c:113: }
      0000F8 80 FB            [24]  545 	sjmp	00101$
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function 'main'
                                    548 ;------------------------------------------------------------
                                    549 ;	test3threads.c:120: void main(void)
                                    550 ;	-----------------------------------------
                                    551 ;	 function main
                                    552 ;	-----------------------------------------
      0000FA                        553 _main:
                                    554 ;	test3threads.c:126: producer_ptr = 0;
      0000FA 75 37 00         [24]  555 	mov	_producer_ptr,#0x00
                                    556 ;	test3threads.c:127: SemaphoreCreate(full, 0);
      0000FD 75 36 00         [24]  557 	mov	_full,#0x00
                                    558 ;	test3threads.c:128: SemaphoreCreate(mutex, 1);
      000100 75 34 01         [24]  559 	mov	_mutex,#0x01
                                    560 ;	test3threads.c:129: SemaphoreCreate(empty, 3);
      000103 75 35 03         [24]  561 	mov	_empty,#0x03
                                    562 ;	test3threads.c:136: ThreadCreate(Consumer);
      000106 90 00 B0         [24]  563 	mov	dptr,#_Consumer
      000109 12 01 C5         [24]  564 	lcall	_ThreadCreate
                                    565 ;	test3threads.c:137: ThreadCreate(Producer2);
      00010C 90 00 62         [24]  566 	mov	dptr,#_Producer2
      00010F 12 01 C5         [24]  567 	lcall	_ThreadCreate
                                    568 ;	test3threads.c:138: Producer1();
                                    569 ;	test3threads.c:139: }
      000112 02 00 14         [24]  570 	ljmp	_Producer1
                                    571 ;------------------------------------------------------------
                                    572 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    573 ;------------------------------------------------------------
                                    574 ;	test3threads.c:141: void _sdcc_gsinit_startup(void)
                                    575 ;	-----------------------------------------
                                    576 ;	 function _sdcc_gsinit_startup
                                    577 ;	-----------------------------------------
      000115                        578 __sdcc_gsinit_startup:
                                    579 ;	test3threads.c:145: __endasm;
      000115 02 01 20         [24]  580 	LJMP	_Bootstrap
                                    581 ;	test3threads.c:146: }
      000118 22               [24]  582 	ret
                                    583 ;------------------------------------------------------------
                                    584 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    585 ;------------------------------------------------------------
                                    586 ;	test3threads.c:148: void _mcs51_genRAMCLEAR(void) {}
                                    587 ;	-----------------------------------------
                                    588 ;	 function _mcs51_genRAMCLEAR
                                    589 ;	-----------------------------------------
      000119                        590 __mcs51_genRAMCLEAR:
      000119 22               [24]  591 	ret
                                    592 ;------------------------------------------------------------
                                    593 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    594 ;------------------------------------------------------------
                                    595 ;	test3threads.c:149: void _mcs51_genXINIT(void) {}
                                    596 ;	-----------------------------------------
                                    597 ;	 function _mcs51_genXINIT
                                    598 ;	-----------------------------------------
      00011A                        599 __mcs51_genXINIT:
      00011A 22               [24]  600 	ret
                                    601 ;------------------------------------------------------------
                                    602 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    603 ;------------------------------------------------------------
                                    604 ;	test3threads.c:150: void _mcs51_genXRAMCLEAR(void) {}
                                    605 ;	-----------------------------------------
                                    606 ;	 function _mcs51_genXRAMCLEAR
                                    607 ;	-----------------------------------------
      00011B                        608 __mcs51_genXRAMCLEAR:
      00011B 22               [24]  609 	ret
                                    610 ;------------------------------------------------------------
                                    611 ;Allocation info for local variables in function 'timer0_ISR'
                                    612 ;------------------------------------------------------------
                                    613 ;	test3threads.c:151: void timer0_ISR(void) __interrupt(1) {
                                    614 ;	-----------------------------------------
                                    615 ;	 function timer0_ISR
                                    616 ;	-----------------------------------------
      00011C                        617 _timer0_ISR:
                                    618 ;	test3threads.c:154: __endasm;
      00011C 02 01 49         [24]  619 	ljmp	_myTimer0Handler
                                    620 ;	test3threads.c:155: }
      00011F 32               [24]  621 	reti
                                    622 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    623 ;	eliminated unneeded push/pop not_psw
                                    624 ;	eliminated unneeded push/pop dpl
                                    625 ;	eliminated unneeded push/pop dph
                                    626 ;	eliminated unneeded push/pop b
                                    627 ;	eliminated unneeded push/pop acc
                                    628 	.area CSEG    (CODE)
                                    629 	.area CONST   (CODE)
                                    630 	.area XINIT   (CODE)
                                    631 	.area CABS    (ABS,CODE)
