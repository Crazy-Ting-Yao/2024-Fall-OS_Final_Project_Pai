                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _clockwise
                                    111 	.globl _temp
                                    112 	.globl _newThread
                                    113 	.globl _tempSP
                                    114 	.globl _i
                                    115 	.globl _threadMask
                                    116 	.globl _currentThread
                                    117 	.globl _savedSP
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadYield
                                    120 	.globl _ThreadExit
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
                           000025   236 _savedSP	=	0x0025
                           000029   237 _currentThread	=	0x0029
                           00002A   238 _threadMask	=	0x002a
                           00002B   239 _i	=	0x002b
                           00002C   240 _tempSP	=	0x002c
                           00002D   241 _newThread	=	0x002d
                           00002E   242 _temp	=	0x002e
                           00002F   243 _clockwise	=	0x002f
                                    244 ;--------------------------------------------------------
                                    245 ; overlayable items in internal ram
                                    246 ;--------------------------------------------------------
                                    247 	.area	OSEG    (OVR,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; indirectly addressable internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area ISEG    (DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area IABS    (ABS,DATA)
                                    256 	.area IABS    (ABS,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; bit data
                                    259 ;--------------------------------------------------------
                                    260 	.area BSEG    (BIT)
      000002                        261 _myTimer0Handler_sloc0_1_0:
      000002                        262 	.ds 1
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; uninitialized external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; initialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; Home
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
                                    300 	.area HOME    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; code
                                    303 ;--------------------------------------------------------
                                    304 	.area CSEG    (CODE)
                                    305 ;------------------------------------------------------------
                                    306 ;Allocation info for local variables in function 'Bootstrap'
                                    307 ;------------------------------------------------------------
                                    308 ;	preemptive.c:81: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      00012A                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:82: threadMask = 0;
      00012A 75 2A 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:83: clockwise = 1;
      00012D 75 2F 01         [24]  324 	mov	_clockwise,#0x01
                                    325 ;	preemptive.c:84: TMOD = 0; // timer 0 mode 0
      000130 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:87: IE = 0x82; // enable timer 0 interrupt,
      000133 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:88: TR0 = 1; // start running timer0
                                    330 ;	assignBit
      000136 D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:89: currentThread = ThreadCreate(main);
      000138 90 00 FE         [24]  333 	mov	dptr,#_main
      00013B 12 01 DC         [24]  334 	lcall	_ThreadCreate
      00013E 85 82 29         [24]  335 	mov	_currentThread,dpl
                                    336 ;	preemptive.c:90: RESTORESTATE;
      000141 E5 29            [12]  337 	mov	a,_currentThread
      000143 24 25            [12]  338 	add	a, #_savedSP
      000145 F9               [12]  339 	mov	r1,a
      000146 87 81            [24]  340 	mov	_SP,@r1
      000148 D0 D0            [24]  341 	POP PSW 
      00014A D0 83            [24]  342 	POP DPH 
      00014C D0 82            [24]  343 	POP DPL 
      00014E D0 F0            [24]  344 	POP B 
      000150 D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:91: }
      000152 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:99: void myTimer0Handler(void) {
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      000153                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:100: EA = 0; // don't do __critial
                                    357 ;	assignBit
      000153 C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:101: SAVESTATE;
      000155 C0 E0            [24]  360 	PUSH ACC 
      000157 C0 F0            [24]  361 	PUSH B 
      000159 C0 82            [24]  362 	PUSH DPL 
      00015B C0 83            [24]  363 	PUSH DPH 
      00015D C0 D0            [24]  364 	PUSH PSW 
      00015F E5 29            [12]  365 	mov	a,_currentThread
      000161 24 25            [12]  366 	add	a, #_savedSP
      000163 F8               [12]  367 	mov	r0,a
      000164 A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:102: do{
      000166                        370 00106$:
                                    371 ;	preemptive.c:103: if(clockwise){
      000166 E5 2F            [12]  372 	mov	a,_clockwise
      000168 60 28            [24]  373 	jz	00102$
                                    374 ;	preemptive.c:104: clockwise = !(currentThread == 3);
      00016A 74 03            [12]  375 	mov	a,#0x03
      00016C B5 29 03         [24]  376 	cjne	a,_currentThread,00146$
      00016F D3               [12]  377 	setb	c
      000170 80 01            [24]  378 	sjmp	00147$
      000172                        379 00146$:
      000172 C3               [12]  380 	clr	c
      000173                        381 00147$:
      000173 B3               [12]  382 	cpl	c
      000174 92 02            [24]  383 	mov	_myTimer0Handler_sloc0_1_0,c
      000176 E4               [12]  384 	clr	a
      000177 33               [12]  385 	rlc	a
      000178 F5 2F            [12]  386 	mov	_clockwise,a
                                    387 ;	preemptive.c:105: currentThread = (currentThread == 3) ? 2 : currentThread + 1;
      00017A 74 03            [12]  388 	mov	a,#0x03
      00017C B5 29 06         [24]  389 	cjne	a,_currentThread,00111$
      00017F 7E 02            [12]  390 	mov	r6,#0x02
      000181 7F 00            [12]  391 	mov	r7,#0x00
      000183 80 09            [24]  392 	sjmp	00112$
      000185                        393 00111$:
      000185 AD 29            [24]  394 	mov	r5,_currentThread
      000187 0D               [12]  395 	inc	r5
      000188 ED               [12]  396 	mov	a,r5
      000189 FE               [12]  397 	mov	r6,a
      00018A 33               [12]  398 	rlc	a
      00018B 95 E0            [12]  399 	subb	a,acc
      00018D FF               [12]  400 	mov	r7,a
      00018E                        401 00112$:
      00018E 8E 29            [24]  402 	mov	_currentThread,r6
      000190 80 1F            [24]  403 	sjmp	00103$
      000192                        404 00102$:
                                    405 ;	preemptive.c:108: clockwise = (currentThread == 0);
      000192 E4               [12]  406 	clr	a
      000193 B5 29 04         [24]  407 	cjne	a,_currentThread,00150$
      000196 74 01            [12]  408 	mov	a,#0x01
      000198 80 01            [24]  409 	sjmp	00151$
      00019A                        410 00150$:
      00019A E4               [12]  411 	clr	a
      00019B                        412 00151$:
      00019B F5 2F            [12]  413 	mov	_clockwise,a
                                    414 ;	preemptive.c:109: currentThread = (currentThread == 0) ? 1 : currentThread - 1;
      00019D E5 29            [12]  415 	mov	a,_currentThread
      00019F 70 05            [24]  416 	jnz	00113$
      0001A1 7E 01            [12]  417 	mov	r6,#0x01
      0001A3 FF               [12]  418 	mov	r7,a
      0001A4 80 09            [24]  419 	sjmp	00114$
      0001A6                        420 00113$:
      0001A6 AD 29            [24]  421 	mov	r5,_currentThread
      0001A8 1D               [12]  422 	dec	r5
      0001A9 ED               [12]  423 	mov	a,r5
      0001AA FE               [12]  424 	mov	r6,a
      0001AB 33               [12]  425 	rlc	a
      0001AC 95 E0            [12]  426 	subb	a,acc
      0001AE FF               [12]  427 	mov	r7,a
      0001AF                        428 00114$:
      0001AF 8E 29            [24]  429 	mov	_currentThread,r6
      0001B1                        430 00103$:
                                    431 ;	preemptive.c:111: temp = 1 << currentThread;
      0001B1 85 29 F0         [24]  432 	mov	b,_currentThread
      0001B4 05 F0            [12]  433 	inc	b
      0001B6 74 01            [12]  434 	mov	a,#0x01
      0001B8 80 02            [24]  435 	sjmp	00154$
      0001BA                        436 00153$:
      0001BA 25 E0            [12]  437 	add	a,acc
      0001BC                        438 00154$:
      0001BC D5 F0 FB         [24]  439 	djnz	b,00153$
      0001BF F5 2E            [12]  440 	mov	_temp,a
                                    441 ;	preemptive.c:112: if (threadMask & temp){
      0001C1 E5 2E            [12]  442 	mov	a,_temp
      0001C3 55 2A            [12]  443 	anl	a,_threadMask
      0001C5 60 9F            [24]  444 	jz	00106$
                                    445 ;	preemptive.c:116: RESTORESTATE;
      0001C7 E5 29            [12]  446 	mov	a,_currentThread
      0001C9 24 25            [12]  447 	add	a, #_savedSP
      0001CB F9               [12]  448 	mov	r1,a
      0001CC 87 81            [24]  449 	mov	_SP,@r1
      0001CE D0 D0            [24]  450 	POP PSW 
      0001D0 D0 83            [24]  451 	POP DPH 
      0001D2 D0 82            [24]  452 	POP DPL 
      0001D4 D0 F0            [24]  453 	POP B 
      0001D6 D0 E0            [24]  454 	POP ACC 
                                    455 ;	preemptive.c:119: EA = 1;
                                    456 ;	assignBit
      0001D8 D2 AF            [12]  457 	setb	_EA
                                    458 ;	preemptive.c:122: __endasm;
      0001DA 32               [24]  459 	RETI
                                    460 ;	preemptive.c:123: }
      0001DB 22               [24]  461 	ret
                                    462 ;------------------------------------------------------------
                                    463 ;Allocation info for local variables in function 'ThreadCreate'
                                    464 ;------------------------------------------------------------
                                    465 ;fp                        Allocated to registers 
                                    466 ;------------------------------------------------------------
                                    467 ;	preemptive.c:125: ThreadID ThreadCreate(FunctionPtr fp){
                                    468 ;	-----------------------------------------
                                    469 ;	 function ThreadCreate
                                    470 ;	-----------------------------------------
      0001DC                        471 _ThreadCreate:
                                    472 ;	preemptive.c:131: EA = 0;
                                    473 ;	assignBit
      0001DC C2 AF            [12]  474 	clr	_EA
                                    475 ;	preemptive.c:132: if(threadMask == 0x0F){
      0001DE 74 0F            [12]  476 	mov	a,#0x0f
      0001E0 B5 2A 04         [24]  477 	cjne	a,_threadMask,00102$
                                    478 ;	preemptive.c:133: return -1;
      0001E3 75 82 FF         [24]  479 	mov	dpl, #0xff
      0001E6 22               [24]  480 	ret
      0001E7                        481 00102$:
                                    482 ;	preemptive.c:174: for(i = 0; i != MAXTHREADS; i++){
      0001E7 75 2B 00         [24]  483 	mov	_i,#0x00
      0001EA                        484 00107$:
      0001EA 74 04            [12]  485 	mov	a,#0x04
      0001EC B5 2B 02         [24]  486 	cjne	a,_i,00137$
      0001EF 80 29            [24]  487 	sjmp	00105$
      0001F1                        488 00137$:
                                    489 ;	preemptive.c:176: temp = 1;
      0001F1 75 2E 01         [24]  490 	mov	_temp,#0x01
                                    491 ;	preemptive.c:177: temp <<= i;
      0001F4 85 2B F0         [24]  492 	mov	b,_i
      0001F7 05 F0            [12]  493 	inc	b
      0001F9 E5 2E            [12]  494 	mov	a,_temp
      0001FB 80 02            [24]  495 	sjmp	00139$
      0001FD                        496 00138$:
      0001FD 25 E0            [12]  497 	add	a,acc
      0001FF                        498 00139$:
      0001FF D5 F0 FB         [24]  499 	djnz	b,00138$
      000202 F5 2E            [12]  500 	mov	_temp,a
                                    501 ;	preemptive.c:178: if(!(threadMask & temp)){
      000204 E5 2E            [12]  502 	mov	a,_temp
      000206 55 2A            [12]  503 	anl	a,_threadMask
      000208 70 09            [24]  504 	jnz	00108$
                                    505 ;	preemptive.c:180: threadMask |= temp;
      00020A E5 2E            [12]  506 	mov	a,_temp
      00020C 42 2A            [12]  507 	orl	_threadMask,a
                                    508 ;	preemptive.c:181: newThread = i;
      00020E 85 2B 2D         [24]  509 	mov	_newThread,_i
                                    510 ;	preemptive.c:182: break;
      000211 80 07            [24]  511 	sjmp	00105$
      000213                        512 00108$:
                                    513 ;	preemptive.c:174: for(i = 0; i != MAXTHREADS; i++){
      000213 E5 2B            [12]  514 	mov	a,_i
      000215 04               [12]  515 	inc	a
      000216 F5 2B            [12]  516 	mov	_i,a
      000218 80 D0            [24]  517 	sjmp	00107$
      00021A                        518 00105$:
                                    519 ;	preemptive.c:186: tempSP = SP;
      00021A 85 81 2C         [24]  520 	mov	_tempSP,_SP
                                    521 ;	preemptive.c:189: SP = (0x3F) + newThread * (0x10);
      00021D E5 2D            [12]  522 	mov	a,_newThread
      00021F C4               [12]  523 	swap	a
      000220 54 F0            [12]  524 	anl	a,#0xf0
      000222 FF               [12]  525 	mov	r7,a
      000223 24 3F            [12]  526 	add	a,#0x3f
      000225 F5 81            [12]  527 	mov	_SP,a
                                    528 ;	preemptive.c:194: __endasm;
      000227 C0 82            [24]  529 	PUSH	DPL
      000229 C0 83            [24]  530 	PUSH	DPH
                                    531 ;	preemptive.c:202: __endasm;
      00022B 54 00            [12]  532 	ANL	A, #0
      00022D C0 E0            [24]  533 	PUSH	ACC
      00022F C0 E0            [24]  534 	PUSH	ACC
      000231 C0 E0            [24]  535 	PUSH	ACC
      000233 C0 E0            [24]  536 	PUSH	ACC
                                    537 ;	preemptive.c:204: PSW = (newThread << 3);
      000235 E5 2D            [12]  538 	mov	a,_newThread
      000237 FF               [12]  539 	mov	r7,a
      000238 C4               [12]  540 	swap	a
      000239 03               [12]  541 	rr	a
      00023A 54 F8            [12]  542 	anl	a,#0xf8
      00023C F5 D0            [12]  543 	mov	_PSW,a
                                    544 ;	preemptive.c:207: __endasm;
      00023E C0 D0            [24]  545 	PUSH	PSW
                                    546 ;	preemptive.c:209: savedSP[newThread] = SP;
      000240 E5 2D            [12]  547 	mov	a,_newThread
      000242 24 25            [12]  548 	add	a, #_savedSP
      000244 F8               [12]  549 	mov	r0,a
      000245 A6 81            [24]  550 	mov	@r0,_SP
                                    551 ;	preemptive.c:211: SP = tempSP;
      000247 85 2C 81         [24]  552 	mov	_SP,_tempSP
                                    553 ;	preemptive.c:212: EA = 1;
                                    554 ;	assignBit
      00024A D2 AF            [12]  555 	setb	_EA
                                    556 ;	preemptive.c:214: return newThread;
      00024C 85 2D 82         [24]  557 	mov	dpl, _newThread
                                    558 ;	preemptive.c:215: }
      00024F 22               [24]  559 	ret
                                    560 ;------------------------------------------------------------
                                    561 ;Allocation info for local variables in function 'ThreadYield'
                                    562 ;------------------------------------------------------------
                                    563 ;	preemptive.c:224: void ThreadYield(void){
                                    564 ;	-----------------------------------------
                                    565 ;	 function ThreadYield
                                    566 ;	-----------------------------------------
      000250                        567 _ThreadYield:
                                    568 ;	preemptive.c:225: EA = 0;
                                    569 ;	assignBit
      000250 C2 AF            [12]  570 	clr	_EA
                                    571 ;	preemptive.c:226: SAVESTATE;
      000252 C0 E0            [24]  572 	PUSH ACC 
      000254 C0 F0            [24]  573 	PUSH B 
      000256 C0 82            [24]  574 	PUSH DPL 
      000258 C0 83            [24]  575 	PUSH DPH 
      00025A C0 D0            [24]  576 	PUSH PSW 
      00025C E5 29            [12]  577 	mov	a,_currentThread
      00025E 24 25            [12]  578 	add	a, #_savedSP
      000260 F8               [12]  579 	mov	r0,a
      000261 A6 81            [24]  580 	mov	@r0,_SP
                                    581 ;	preemptive.c:227: do{
      000263                        582 00103$:
                                    583 ;	preemptive.c:238: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      000263 74 FD            [12]  584 	mov	a,#0x100 - 0x03
      000265 25 29            [12]  585 	add	a,_currentThread
      000267 40 0B            [24]  586 	jc	00108$
      000269 AF 29            [24]  587 	mov	r7,_currentThread
      00026B 0F               [12]  588 	inc	r7
      00026C EF               [12]  589 	mov	a,r7
      00026D FE               [12]  590 	mov	r6,a
      00026E 33               [12]  591 	rlc	a
      00026F 95 E0            [12]  592 	subb	a,acc
      000271 FF               [12]  593 	mov	r7,a
      000272 80 04            [24]  594 	sjmp	00109$
      000274                        595 00108$:
      000274 7E 00            [12]  596 	mov	r6,#0x00
      000276 7F 00            [12]  597 	mov	r7,#0x00
      000278                        598 00109$:
      000278 8E 29            [24]  599 	mov	_currentThread,r6
                                    600 ;	preemptive.c:239: temp = 1 << currentThread;
      00027A 85 29 F0         [24]  601 	mov	b,_currentThread
      00027D 05 F0            [12]  602 	inc	b
      00027F 74 01            [12]  603 	mov	a,#0x01
      000281 80 02            [24]  604 	sjmp	00130$
      000283                        605 00129$:
      000283 25 E0            [12]  606 	add	a,acc
      000285                        607 00130$:
      000285 D5 F0 FB         [24]  608 	djnz	b,00129$
      000288 F5 2E            [12]  609 	mov	_temp,a
                                    610 ;	preemptive.c:240: if (threadMask & temp){
      00028A E5 2E            [12]  611 	mov	a,_temp
      00028C 55 2A            [12]  612 	anl	a,_threadMask
      00028E 60 D3            [24]  613 	jz	00103$
                                    614 ;	preemptive.c:245: EA = 1;
                                    615 ;	assignBit
      000290 D2 AF            [12]  616 	setb	_EA
                                    617 ;	preemptive.c:246: RESTORESTATE;
      000292 E5 29            [12]  618 	mov	a,_currentThread
      000294 24 25            [12]  619 	add	a, #_savedSP
      000296 F9               [12]  620 	mov	r1,a
      000297 87 81            [24]  621 	mov	_SP,@r1
      000299 D0 D0            [24]  622 	POP PSW 
      00029B D0 83            [24]  623 	POP DPH 
      00029D D0 82            [24]  624 	POP DPL 
      00029F D0 F0            [24]  625 	POP B 
      0002A1 D0 E0            [24]  626 	POP ACC 
                                    627 ;	preemptive.c:247: }
      0002A3 22               [24]  628 	ret
                                    629 ;------------------------------------------------------------
                                    630 ;Allocation info for local variables in function 'ThreadExit'
                                    631 ;------------------------------------------------------------
                                    632 ;	preemptive.c:253: void ThreadExit(void)
                                    633 ;	-----------------------------------------
                                    634 ;	 function ThreadExit
                                    635 ;	-----------------------------------------
      0002A4                        636 _ThreadExit:
                                    637 ;	preemptive.c:261: EA = 0;
                                    638 ;	assignBit
      0002A4 C2 AF            [12]  639 	clr	_EA
                                    640 ;	preemptive.c:262: temp = 1 << currentThread;
      0002A6 85 29 F0         [24]  641 	mov	b,_currentThread
      0002A9 05 F0            [12]  642 	inc	b
      0002AB 74 01            [12]  643 	mov	a,#0x01
      0002AD 80 02            [24]  644 	sjmp	00136$
      0002AF                        645 00135$:
      0002AF 25 E0            [12]  646 	add	a,acc
      0002B1                        647 00136$:
      0002B1 D5 F0 FB         [24]  648 	djnz	b,00135$
      0002B4 F5 2E            [12]  649 	mov	_temp,a
                                    650 ;	preemptive.c:263: threadMask ^= temp;
      0002B6 E5 2E            [12]  651 	mov	a,_temp
      0002B8 62 2A            [12]  652 	xrl	_threadMask,a
                                    653 ;	preemptive.c:264: for(i = 0; i < MAXTHREADS; i++){
      0002BA 75 2B 00         [24]  654 	mov	_i,#0x00
      0002BD                        655 00107$:
      0002BD 74 FC            [12]  656 	mov	a,#0x100 - 0x04
      0002BF 25 2B            [12]  657 	add	a,_i
      0002C1 40 22            [24]  658 	jc	00103$
                                    659 ;	preemptive.c:265: temp = 1 << i;
      0002C3 85 2B F0         [24]  660 	mov	b,_i
      0002C6 05 F0            [12]  661 	inc	b
      0002C8 74 01            [12]  662 	mov	a,#0x01
      0002CA 80 02            [24]  663 	sjmp	00139$
      0002CC                        664 00138$:
      0002CC 25 E0            [12]  665 	add	a,acc
      0002CE                        666 00139$:
      0002CE D5 F0 FB         [24]  667 	djnz	b,00138$
      0002D1 F5 2E            [12]  668 	mov	_temp,a
                                    669 ;	preemptive.c:266: if(temp & threadMask){
      0002D3 E5 2A            [12]  670 	mov	a,_threadMask
      0002D5 55 2E            [12]  671 	anl	a,_temp
      0002D7 60 05            [24]  672 	jz	00108$
                                    673 ;	preemptive.c:267: currentThread = i;
      0002D9 85 2B 29         [24]  674 	mov	_currentThread,_i
                                    675 ;	preemptive.c:268: break;
      0002DC 80 07            [24]  676 	sjmp	00103$
      0002DE                        677 00108$:
                                    678 ;	preemptive.c:264: for(i = 0; i < MAXTHREADS; i++){
      0002DE E5 2B            [12]  679 	mov	a,_i
      0002E0 04               [12]  680 	inc	a
      0002E1 F5 2B            [12]  681 	mov	_i,a
      0002E3 80 D8            [24]  682 	sjmp	00107$
      0002E5                        683 00103$:
                                    684 ;	preemptive.c:271: if (i == MAXTHREADS){
      0002E5 74 04            [12]  685 	mov	a,#0x04
      0002E7 B5 2B 03         [24]  686 	cjne	a,_i,00105$
                                    687 ;	preemptive.c:272: currentThread = -1;
      0002EA 75 29 FF         [24]  688 	mov	_currentThread,#0xff
      0002ED                        689 00105$:
                                    690 ;	preemptive.c:274: RESTORESTATE;
      0002ED E5 29            [12]  691 	mov	a,_currentThread
      0002EF 24 25            [12]  692 	add	a, #_savedSP
      0002F1 F9               [12]  693 	mov	r1,a
      0002F2 87 81            [24]  694 	mov	_SP,@r1
      0002F4 D0 D0            [24]  695 	POP PSW 
      0002F6 D0 83            [24]  696 	POP DPH 
      0002F8 D0 82            [24]  697 	POP DPL 
      0002FA D0 F0            [24]  698 	POP B 
      0002FC D0 E0            [24]  699 	POP ACC 
                                    700 ;	preemptive.c:275: EA = 1;
                                    701 ;	assignBit
      0002FE D2 AF            [12]  702 	setb	_EA
                                    703 ;	preemptive.c:276: }
      000300 22               [24]  704 	ret
                                    705 	.area CSEG    (CODE)
                                    706 	.area CONST   (CODE)
                                    707 	.area XINIT   (CODE)
                                    708 	.area CABS    (ABS,CODE)
