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
                                    116 	.globl _consumer_ptr
                                    117 	.globl _producer_ptr
                                    118 	.globl _full
                                    119 	.globl _empty
                                    120 	.globl _mutex
                                    121 	.globl _currentChar
                                    122 	.globl _buffer
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000081   129 _SP	=	0x0081
                           000082   130 _DPL	=	0x0082
                           000083   131 _DPH	=	0x0083
                           000087   132 _PCON	=	0x0087
                           000088   133 _TCON	=	0x0088
                           000089   134 _TMOD	=	0x0089
                           00008A   135 _TL0	=	0x008a
                           00008B   136 _TL1	=	0x008b
                           00008C   137 _TH0	=	0x008c
                           00008D   138 _TH1	=	0x008d
                           000090   139 _P1	=	0x0090
                           000098   140 _SCON	=	0x0098
                           000099   141 _SBUF	=	0x0099
                           0000A0   142 _P2	=	0x00a0
                           0000A8   143 _IE	=	0x00a8
                           0000B0   144 _P3	=	0x00b0
                           0000B8   145 _IP	=	0x00b8
                           0000D0   146 _PSW	=	0x00d0
                           0000E0   147 _ACC	=	0x00e0
                           0000F0   148 _B	=	0x00f0
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0_0	=	0x0080
                           000081   155 _P0_1	=	0x0081
                           000082   156 _P0_2	=	0x0082
                           000083   157 _P0_3	=	0x0083
                           000084   158 _P0_4	=	0x0084
                           000085   159 _P0_5	=	0x0085
                           000086   160 _P0_6	=	0x0086
                           000087   161 _P0_7	=	0x0087
                           000088   162 _IT0	=	0x0088
                           000089   163 _IE0	=	0x0089
                           00008A   164 _IT1	=	0x008a
                           00008B   165 _IE1	=	0x008b
                           00008C   166 _TR0	=	0x008c
                           00008D   167 _TF0	=	0x008d
                           00008E   168 _TR1	=	0x008e
                           00008F   169 _TF1	=	0x008f
                           000090   170 _P1_0	=	0x0090
                           000091   171 _P1_1	=	0x0091
                           000092   172 _P1_2	=	0x0092
                           000093   173 _P1_3	=	0x0093
                           000094   174 _P1_4	=	0x0094
                           000095   175 _P1_5	=	0x0095
                           000096   176 _P1_6	=	0x0096
                           000097   177 _P1_7	=	0x0097
                           000098   178 _RI	=	0x0098
                           000099   179 _TI	=	0x0099
                           00009A   180 _RB8	=	0x009a
                           00009B   181 _TB8	=	0x009b
                           00009C   182 _REN	=	0x009c
                           00009D   183 _SM2	=	0x009d
                           00009E   184 _SM1	=	0x009e
                           00009F   185 _SM0	=	0x009f
                           0000A0   186 _P2_0	=	0x00a0
                           0000A1   187 _P2_1	=	0x00a1
                           0000A2   188 _P2_2	=	0x00a2
                           0000A3   189 _P2_3	=	0x00a3
                           0000A4   190 _P2_4	=	0x00a4
                           0000A5   191 _P2_5	=	0x00a5
                           0000A6   192 _P2_6	=	0x00a6
                           0000A7   193 _P2_7	=	0x00a7
                           0000A8   194 _EX0	=	0x00a8
                           0000A9   195 _ET0	=	0x00a9
                           0000AA   196 _EX1	=	0x00aa
                           0000AB   197 _ET1	=	0x00ab
                           0000AC   198 _ES	=	0x00ac
                           0000AF   199 _EA	=	0x00af
                           0000B0   200 _P3_0	=	0x00b0
                           0000B1   201 _P3_1	=	0x00b1
                           0000B2   202 _P3_2	=	0x00b2
                           0000B3   203 _P3_3	=	0x00b3
                           0000B4   204 _P3_4	=	0x00b4
                           0000B5   205 _P3_5	=	0x00b5
                           0000B6   206 _P3_6	=	0x00b6
                           0000B7   207 _P3_7	=	0x00b7
                           0000B0   208 _RXD	=	0x00b0
                           0000B1   209 _TXD	=	0x00b1
                           0000B2   210 _INT0	=	0x00b2
                           0000B3   211 _INT1	=	0x00b3
                           0000B4   212 _T0	=	0x00b4
                           0000B5   213 _T1	=	0x00b5
                           0000B6   214 _WR	=	0x00b6
                           0000B7   215 _RD	=	0x00b7
                           0000B8   216 _PX0	=	0x00b8
                           0000B9   217 _PT0	=	0x00b9
                           0000BA   218 _PX1	=	0x00ba
                           0000BB   219 _PT1	=	0x00bb
                           0000BC   220 _PS	=	0x00bc
                           0000D0   221 _P	=	0x00d0
                           0000D1   222 _F1	=	0x00d1
                           0000D2   223 _OV	=	0x00d2
                           0000D3   224 _RS0	=	0x00d3
                           0000D4   225 _RS1	=	0x00d4
                           0000D5   226 _F0	=	0x00d5
                           0000D6   227 _AC	=	0x00d6
                           0000D7   228 _CY	=	0x00d7
                                    229 ;--------------------------------------------------------
                                    230 ; overlayable register banks
                                    231 ;--------------------------------------------------------
                                    232 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        233 	.ds 8
                                    234 ;--------------------------------------------------------
                                    235 ; internal ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area DSEG    (DATA)
                           000030   238 _buffer	=	0x0030
                           000033   239 _currentChar	=	0x0033
                           000034   240 _mutex	=	0x0034
                           000035   241 _empty	=	0x0035
                           000036   242 _full	=	0x0036
                           000037   243 _producer_ptr	=	0x0037
                           000038   244 _consumer_ptr	=	0x0038
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 ;--------------------------------------------------------
                                    249 ; Stack segment in internal ram
                                    250 ;--------------------------------------------------------
                                    251 	.area SSEG
      000021                        252 __start__stack:
      000021                        253 	.ds	1
                                    254 
                                    255 ;--------------------------------------------------------
                                    256 ; indirectly addressable internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area ISEG    (DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; absolute internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area IABS    (ABS,DATA)
                                    263 	.area IABS    (ABS,DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; bit data
                                    266 ;--------------------------------------------------------
                                    267 	.area BSEG    (BIT)
                                    268 ;--------------------------------------------------------
                                    269 ; paged external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area PSEG    (PAG,XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; uninitialized external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XSEG    (XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; absolute external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XABS    (ABS,XDATA)
                                    280 ;--------------------------------------------------------
                                    281 ; initialized external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area XISEG   (XDATA)
                                    284 	.area HOME    (CODE)
                                    285 	.area GSINIT0 (CODE)
                                    286 	.area GSINIT1 (CODE)
                                    287 	.area GSINIT2 (CODE)
                                    288 	.area GSINIT3 (CODE)
                                    289 	.area GSINIT4 (CODE)
                                    290 	.area GSINIT5 (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area CSEG    (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; interrupt vector
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
      000000                        298 __interrupt_vect:
      000000 02 00 C1         [24]  299 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  300 	reti
      000004                        301 	.ds	7
      00000B 02 00 C8         [24]  302 	ljmp	_timer0_ISR
                                    303 ;--------------------------------------------------------
                                    304 ; global & static initialisations
                                    305 ;--------------------------------------------------------
                                    306 	.area HOME    (CODE)
                                    307 	.area GSINIT  (CODE)
                                    308 	.area GSFINAL (CODE)
                                    309 	.area GSINIT  (CODE)
                                    310 	.globl __sdcc_gsinit_startup
                                    311 	.globl __sdcc_program_startup
                                    312 	.globl __start__stack
                                    313 	.globl __mcs51_genXINIT
                                    314 	.globl __mcs51_genXRAMCLEAR
                                    315 	.globl __mcs51_genRAMCLEAR
                                    316 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  317 	ljmp	__sdcc_program_startup
                                    318 ;--------------------------------------------------------
                                    319 ; Home
                                    320 ;--------------------------------------------------------
                                    321 	.area HOME    (CODE)
                                    322 	.area HOME    (CODE)
      00000E                        323 __sdcc_program_startup:
      00000E 02 00 AF         [24]  324 	ljmp	_main
                                    325 ;	return from main will return to caller
                                    326 ;--------------------------------------------------------
                                    327 ; code
                                    328 ;--------------------------------------------------------
                                    329 	.area CSEG    (CODE)
                                    330 ;------------------------------------------------------------
                                    331 ;Allocation info for local variables in function 'Producer'
                                    332 ;------------------------------------------------------------
                                    333 ;	testpreempt.c:30: void Producer(void)
                                    334 ;	-----------------------------------------
                                    335 ;	 function Producer
                                    336 ;	-----------------------------------------
      000014                        337 _Producer:
                           000007   338 	ar7 = 0x07
                           000006   339 	ar6 = 0x06
                           000005   340 	ar5 = 0x05
                           000004   341 	ar4 = 0x04
                           000003   342 	ar3 = 0x03
                           000002   343 	ar2 = 0x02
                           000001   344 	ar1 = 0x01
                           000000   345 	ar0 = 0x00
                                    346 ;	testpreempt.c:37: currentChar = 'A';
      000014 75 33 41         [24]  347 	mov	_currentChar,#0x41
                                    348 ;	testpreempt.c:38: producer_ptr = 0;
      000017 75 37 00         [24]  349 	mov	_producer_ptr,#0x00
                                    350 ;	testpreempt.c:39: while (1){
      00001A                        351 00102$:
                                    352 ;	testpreempt.c:43: SemaphoreWaitBody(empty,  L(__COUNTER__));
      00001A                        353 0$:
      00001A E5 35            [12]  354 	MOV A, _empty 
      00001C 60 FC            [24]  355 	JZ 0$ 
      00001E 20 E7 F9         [24]  356 	JB ACC.7, 0$ 
      000021 15 35            [12]  357 	dec _empty 
                                    358 ;	testpreempt.c:44: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000023                        359 1$:
      000023 E5 34            [12]  360 	MOV A, _mutex 
      000025 60 FC            [24]  361 	JZ 1$ 
      000027 20 E7 F9         [24]  362 	JB ACC.7, 1$ 
      00002A 15 34            [12]  363 	dec _mutex 
                                    364 ;	testpreempt.c:45: buffer[producer_ptr] = currentChar;
      00002C E5 37            [12]  365 	mov	a,_producer_ptr
      00002E 24 30            [12]  366 	add	a, #_buffer
      000030 F8               [12]  367 	mov	r0,a
      000031 A6 33            [24]  368 	mov	@r0,_currentChar
                                    369 ;	testpreempt.c:46: SemaphoreSignal(mutex);
      000033 05 34            [12]  370 	INC _mutex 
                                    371 ;	testpreempt.c:47: producer_ptr = (producer_ptr == 2) ? 0 : producer_ptr + 1;
      000035 74 02            [12]  372 	mov	a,#0x02
      000037 B5 37 06         [24]  373 	cjne	a,_producer_ptr,00106$
      00003A 7E 00            [12]  374 	mov	r6,#0x00
      00003C 7F 00            [12]  375 	mov	r7,#0x00
      00003E 80 09            [24]  376 	sjmp	00107$
      000040                        377 00106$:
      000040 AD 37            [24]  378 	mov	r5,_producer_ptr
      000042 0D               [12]  379 	inc	r5
      000043 ED               [12]  380 	mov	a,r5
      000044 FE               [12]  381 	mov	r6,a
      000045 33               [12]  382 	rlc	a
      000046 95 E0            [12]  383 	subb	a,acc
      000048 FF               [12]  384 	mov	r7,a
      000049                        385 00107$:
      000049 8E 37            [24]  386 	mov	_producer_ptr,r6
                                    387 ;	testpreempt.c:48: SemaphoreSignal(full);
      00004B 05 36            [12]  388 	INC _full 
                                    389 ;	testpreempt.c:49: currentChar = (currentChar == 'Z') ? 'A' : currentChar + 1;
      00004D 74 5A            [12]  390 	mov	a,#0x5a
      00004F B5 33 06         [24]  391 	cjne	a,_currentChar,00108$
      000052 7E 41            [12]  392 	mov	r6,#0x41
      000054 7F 00            [12]  393 	mov	r7,#0x00
      000056 80 09            [24]  394 	sjmp	00109$
      000058                        395 00108$:
      000058 AD 33            [24]  396 	mov	r5,_currentChar
      00005A 0D               [12]  397 	inc	r5
      00005B ED               [12]  398 	mov	a,r5
      00005C FE               [12]  399 	mov	r6,a
      00005D 33               [12]  400 	rlc	a
      00005E 95 E0            [12]  401 	subb	a,acc
      000060 FF               [12]  402 	mov	r7,a
      000061                        403 00109$:
      000061 8E 33            [24]  404 	mov	_currentChar,r6
                                    405 ;	testpreempt.c:51: }
      000063 80 B5            [24]  406 	sjmp	00102$
                                    407 ;------------------------------------------------------------
                                    408 ;Allocation info for local variables in function 'Consumer'
                                    409 ;------------------------------------------------------------
                                    410 ;	testpreempt.c:58: void Consumer(void)
                                    411 ;	-----------------------------------------
                                    412 ;	 function Consumer
                                    413 ;	-----------------------------------------
      000065                        414 _Consumer:
                                    415 ;	testpreempt.c:64: EA = 0;
                                    416 ;	assignBit
      000065 C2 AF            [12]  417 	clr	_EA
                                    418 ;	testpreempt.c:65: TMOD |= 0x20;
      000067 43 89 20         [24]  419 	orl	_TMOD,#0x20
                                    420 ;	testpreempt.c:66: TH1 = -6;
      00006A 75 8D FA         [24]  421 	mov	_TH1,#0xfa
                                    422 ;	testpreempt.c:67: SCON = 0x50;
      00006D 75 98 50         [24]  423 	mov	_SCON,#0x50
                                    424 ;	testpreempt.c:68: TR1 = 1;
                                    425 ;	assignBit
      000070 D2 8E            [12]  426 	setb	_TR1
                                    427 ;	testpreempt.c:69: EA = 1;
                                    428 ;	assignBit
      000072 D2 AF            [12]  429 	setb	_EA
                                    430 ;	testpreempt.c:70: consumer_ptr = 0;
      000074 75 38 00         [24]  431 	mov	_consumer_ptr,#0x00
                                    432 ;	testpreempt.c:71: while (1){
      000077                        433 00105$:
                                    434 ;	testpreempt.c:76: SemaphoreWaitBody(full,  L(__COUNTER__));
      000077                        435 2$:
      000077 E5 36            [12]  436 	MOV A, _full 
      000079 60 FC            [24]  437 	JZ 2$ 
      00007B 20 E7 F9         [24]  438 	JB ACC.7, 2$ 
      00007E 15 36            [12]  439 	dec _full 
                                    440 ;	testpreempt.c:77: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000080                        441 3$:
      000080 E5 34            [12]  442 	MOV A, _mutex 
      000082 60 FC            [24]  443 	JZ 3$ 
      000084 20 E7 F9         [24]  444 	JB ACC.7, 3$ 
      000087 15 34            [12]  445 	dec _mutex 
                                    446 ;	testpreempt.c:84: SBUF = buffer[consumer_ptr];
      000089 E5 38            [12]  447 	mov	a,_consumer_ptr
      00008B 24 30            [12]  448 	add	a, #_buffer
      00008D F9               [12]  449 	mov	r1,a
      00008E 87 99            [24]  450 	mov	_SBUF,@r1
                                    451 ;	testpreempt.c:85: SemaphoreSignal(mutex);
      000090 05 34            [12]  452 	INC _mutex 
                                    453 ;	testpreempt.c:86: consumer_ptr = (consumer_ptr == 2) ? 0 : consumer_ptr + 1;
      000092 74 02            [12]  454 	mov	a,#0x02
      000094 B5 38 06         [24]  455 	cjne	a,_consumer_ptr,00109$
      000097 7E 00            [12]  456 	mov	r6,#0x00
      000099 7F 00            [12]  457 	mov	r7,#0x00
      00009B 80 09            [24]  458 	sjmp	00110$
      00009D                        459 00109$:
      00009D AD 38            [24]  460 	mov	r5,_consumer_ptr
      00009F 0D               [12]  461 	inc	r5
      0000A0 ED               [12]  462 	mov	a,r5
      0000A1 FE               [12]  463 	mov	r6,a
      0000A2 33               [12]  464 	rlc	a
      0000A3 95 E0            [12]  465 	subb	a,acc
      0000A5 FF               [12]  466 	mov	r7,a
      0000A6                        467 00110$:
      0000A6 8E 38            [24]  468 	mov	_consumer_ptr,r6
                                    469 ;	testpreempt.c:87: SemaphoreSignal(empty);
      0000A8 05 35            [12]  470 	INC _empty 
                                    471 ;	testpreempt.c:88: while (!TI);
      0000AA                        472 00101$:
                                    473 ;	testpreempt.c:89: TI = 0;
                                    474 ;	assignBit
      0000AA 10 99 CA         [24]  475 	jbc	_TI,00105$
                                    476 ;	testpreempt.c:91: }
      0000AD 80 FB            [24]  477 	sjmp	00101$
                                    478 ;------------------------------------------------------------
                                    479 ;Allocation info for local variables in function 'main'
                                    480 ;------------------------------------------------------------
                                    481 ;	testpreempt.c:98: void main(void)
                                    482 ;	-----------------------------------------
                                    483 ;	 function main
                                    484 ;	-----------------------------------------
      0000AF                        485 _main:
                                    486 ;	testpreempt.c:105: SemaphoreCreate(full, 0);
      0000AF 75 36 00         [24]  487 	mov	_full,#0x00
                                    488 ;	testpreempt.c:106: SemaphoreCreate(mutex, 1);
      0000B2 75 34 01         [24]  489 	mov	_mutex,#0x01
                                    490 ;	testpreempt.c:107: SemaphoreCreate(empty, 3);
      0000B5 75 35 03         [24]  491 	mov	_empty,#0x03
                                    492 ;	testpreempt.c:114: ThreadCreate(Producer);
      0000B8 90 00 14         [24]  493 	mov	dptr,#_Producer
      0000BB 12 01 47         [24]  494 	lcall	_ThreadCreate
                                    495 ;	testpreempt.c:115: Consumer();
                                    496 ;	testpreempt.c:116: }
      0000BE 02 00 65         [24]  497 	ljmp	_Consumer
                                    498 ;------------------------------------------------------------
                                    499 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    500 ;------------------------------------------------------------
                                    501 ;	testpreempt.c:118: void _sdcc_gsinit_startup(void)
                                    502 ;	-----------------------------------------
                                    503 ;	 function _sdcc_gsinit_startup
                                    504 ;	-----------------------------------------
      0000C1                        505 __sdcc_gsinit_startup:
                                    506 ;	testpreempt.c:122: __endasm;
      0000C1 02 00 CC         [24]  507 	LJMP	_Bootstrap
                                    508 ;	testpreempt.c:123: }
      0000C4 22               [24]  509 	ret
                                    510 ;------------------------------------------------------------
                                    511 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    512 ;------------------------------------------------------------
                                    513 ;	testpreempt.c:125: void _mcs51_genRAMCLEAR(void) {}
                                    514 ;	-----------------------------------------
                                    515 ;	 function _mcs51_genRAMCLEAR
                                    516 ;	-----------------------------------------
      0000C5                        517 __mcs51_genRAMCLEAR:
      0000C5 22               [24]  518 	ret
                                    519 ;------------------------------------------------------------
                                    520 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    521 ;------------------------------------------------------------
                                    522 ;	testpreempt.c:126: void _mcs51_genXINIT(void) {}
                                    523 ;	-----------------------------------------
                                    524 ;	 function _mcs51_genXINIT
                                    525 ;	-----------------------------------------
      0000C6                        526 __mcs51_genXINIT:
      0000C6 22               [24]  527 	ret
                                    528 ;------------------------------------------------------------
                                    529 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    530 ;------------------------------------------------------------
                                    531 ;	testpreempt.c:127: void _mcs51_genXRAMCLEAR(void) {}
                                    532 ;	-----------------------------------------
                                    533 ;	 function _mcs51_genXRAMCLEAR
                                    534 ;	-----------------------------------------
      0000C7                        535 __mcs51_genXRAMCLEAR:
      0000C7 22               [24]  536 	ret
                                    537 ;------------------------------------------------------------
                                    538 ;Allocation info for local variables in function 'timer0_ISR'
                                    539 ;------------------------------------------------------------
                                    540 ;	testpreempt.c:128: void timer0_ISR(void) __interrupt(1) {
                                    541 ;	-----------------------------------------
                                    542 ;	 function timer0_ISR
                                    543 ;	-----------------------------------------
      0000C8                        544 _timer0_ISR:
                                    545 ;	testpreempt.c:131: __endasm;
      0000C8 02 00 F2         [24]  546 	ljmp	_myTimer0Handler
                                    547 ;	testpreempt.c:132: }
      0000CB 32               [24]  548 	reti
                                    549 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    550 ;	eliminated unneeded push/pop not_psw
                                    551 ;	eliminated unneeded push/pop dpl
                                    552 ;	eliminated unneeded push/pop dph
                                    553 ;	eliminated unneeded push/pop b
                                    554 ;	eliminated unneeded push/pop acc
                                    555 	.area CSEG    (CODE)
                                    556 	.area CONST   (CODE)
                                    557 	.area XINIT   (CODE)
                                    558 	.area CABS    (ABS,CODE)
