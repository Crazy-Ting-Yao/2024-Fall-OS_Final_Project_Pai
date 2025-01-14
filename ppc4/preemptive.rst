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
      000000                        261 _myTimer0Handler_sloc0_1_0:
      000000                        262 	.ds 1
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
      000120                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:82: threadMask = 0;
      000120 75 2A 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:83: clockwise = 1;
      000123 75 2F 01         [24]  324 	mov	_clockwise,#0x01
                                    325 ;	preemptive.c:84: TMOD = 0; // timer 0 mode 0
      000126 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:87: IE = 0x82; // enable timer 0 interrupt,
      000129 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:88: TR0 = 1; // start running timer0
                                    330 ;	assignBit
      00012C D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:89: currentThread = ThreadCreate(main);
      00012E 90 00 FA         [24]  333 	mov	dptr,#_main
      000131 12 01 C5         [24]  334 	lcall	_ThreadCreate
      000134 85 82 29         [24]  335 	mov	_currentThread,dpl
                                    336 ;	preemptive.c:90: RESTORESTATE;
      000137 E5 29            [12]  337 	mov	a,_currentThread
      000139 24 25            [12]  338 	add	a, #_savedSP
      00013B F9               [12]  339 	mov	r1,a
      00013C 87 81            [24]  340 	mov	_SP,@r1
      00013E D0 D0            [24]  341 	POP PSW 
      000140 D0 83            [24]  342 	POP DPH 
      000142 D0 82            [24]  343 	POP DPL 
      000144 D0 F0            [24]  344 	POP B 
      000146 D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:91: }
      000148 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:99: void myTimer0Handler(void) {
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      000149                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:100: EA = 0; // don't do __critial
                                    357 ;	assignBit
      000149 C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:101: SAVESTATE;
      00014B C0 E0            [24]  360 	PUSH ACC 
      00014D C0 F0            [24]  361 	PUSH B 
      00014F C0 82            [24]  362 	PUSH DPL 
      000151 C0 83            [24]  363 	PUSH DPH 
      000153 C0 D0            [24]  364 	PUSH PSW 
      000155 E5 29            [12]  365 	mov	a,_currentThread
      000157 24 25            [12]  366 	add	a, #_savedSP
      000159 F8               [12]  367 	mov	r0,a
      00015A A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:102: do{
      00015C                        370 00112$:
                                    371 ;	preemptive.c:103: if(clockwise){
      00015C E5 2F            [12]  372 	mov	a,_clockwise
      00015E 60 21            [24]  373 	jz	00108$
                                    374 ;	preemptive.c:104: clockwise = !(currentThread == 3);
      000160 74 03            [12]  375 	mov	a,#0x03
      000162 B5 29 03         [24]  376 	cjne	a,_currentThread,00148$
      000165 D3               [12]  377 	setb	c
      000166 80 01            [24]  378 	sjmp	00149$
      000168                        379 00148$:
      000168 C3               [12]  380 	clr	c
      000169                        381 00149$:
      000169 B3               [12]  382 	cpl	c
      00016A 92 00            [24]  383 	mov	_myTimer0Handler_sloc0_1_0,c
      00016C E4               [12]  384 	clr	a
      00016D 33               [12]  385 	rlc	a
      00016E F5 2F            [12]  386 	mov	_clockwise,a
                                    387 ;	preemptive.c:105: if(currentThread == 3) currentThread = 2;
      000170 74 03            [12]  388 	mov	a,#0x03
      000172 B5 29 05         [24]  389 	cjne	a,_currentThread,00102$
      000175 75 29 02         [24]  390 	mov	_currentThread,#0x02
      000178 80 20            [24]  391 	sjmp	00109$
      00017A                        392 00102$:
                                    393 ;	preemptive.c:106: else currentThread++;
      00017A E5 29            [12]  394 	mov	a,_currentThread
      00017C 04               [12]  395 	inc	a
      00017D F5 29            [12]  396 	mov	_currentThread,a
      00017F 80 19            [24]  397 	sjmp	00109$
      000181                        398 00108$:
                                    399 ;	preemptive.c:109: clockwise = (currentThread == 0);
      000181 E4               [12]  400 	clr	a
      000182 B5 29 04         [24]  401 	cjne	a,_currentThread,00152$
      000185 74 01            [12]  402 	mov	a,#0x01
      000187 80 01            [24]  403 	sjmp	00153$
      000189                        404 00152$:
      000189 E4               [12]  405 	clr	a
      00018A                        406 00153$:
      00018A F5 2F            [12]  407 	mov	_clockwise,a
                                    408 ;	preemptive.c:110: if(currentThread == 0) currentThread = 1;
      00018C E5 29            [12]  409 	mov	a,_currentThread
      00018E 70 05            [24]  410 	jnz	00105$
      000190 75 29 01         [24]  411 	mov	_currentThread,#0x01
      000193 80 05            [24]  412 	sjmp	00109$
      000195                        413 00105$:
                                    414 ;	preemptive.c:111: else currentThread--;
      000195 E5 29            [12]  415 	mov	a,_currentThread
      000197 14               [12]  416 	dec	a
      000198 F5 29            [12]  417 	mov	_currentThread,a
      00019A                        418 00109$:
                                    419 ;	preemptive.c:113: temp = 1 << currentThread;
      00019A 85 29 F0         [24]  420 	mov	b,_currentThread
      00019D 05 F0            [12]  421 	inc	b
      00019F 74 01            [12]  422 	mov	a,#0x01
      0001A1 80 02            [24]  423 	sjmp	00156$
      0001A3                        424 00155$:
      0001A3 25 E0            [12]  425 	add	a,acc
      0001A5                        426 00156$:
      0001A5 D5 F0 FB         [24]  427 	djnz	b,00155$
      0001A8 F5 2E            [12]  428 	mov	_temp,a
                                    429 ;	preemptive.c:114: if (threadMask & temp){
      0001AA E5 2E            [12]  430 	mov	a,_temp
      0001AC 55 2A            [12]  431 	anl	a,_threadMask
      0001AE 60 AC            [24]  432 	jz	00112$
                                    433 ;	preemptive.c:118: RESTORESTATE;
      0001B0 E5 29            [12]  434 	mov	a,_currentThread
      0001B2 24 25            [12]  435 	add	a, #_savedSP
      0001B4 F9               [12]  436 	mov	r1,a
      0001B5 87 81            [24]  437 	mov	_SP,@r1
      0001B7 D0 D0            [24]  438 	POP PSW 
      0001B9 D0 83            [24]  439 	POP DPH 
      0001BB D0 82            [24]  440 	POP DPL 
      0001BD D0 F0            [24]  441 	POP B 
      0001BF D0 E0            [24]  442 	POP ACC 
                                    443 ;	preemptive.c:121: EA = 1;
                                    444 ;	assignBit
      0001C1 D2 AF            [12]  445 	setb	_EA
                                    446 ;	preemptive.c:124: __endasm;
      0001C3 32               [24]  447 	RETI
                                    448 ;	preemptive.c:125: }
      0001C4 22               [24]  449 	ret
                                    450 ;------------------------------------------------------------
                                    451 ;Allocation info for local variables in function 'ThreadCreate'
                                    452 ;------------------------------------------------------------
                                    453 ;fp                        Allocated to registers 
                                    454 ;------------------------------------------------------------
                                    455 ;	preemptive.c:127: ThreadID ThreadCreate(FunctionPtr fp){
                                    456 ;	-----------------------------------------
                                    457 ;	 function ThreadCreate
                                    458 ;	-----------------------------------------
      0001C5                        459 _ThreadCreate:
                                    460 ;	preemptive.c:133: EA = 0;
                                    461 ;	assignBit
      0001C5 C2 AF            [12]  462 	clr	_EA
                                    463 ;	preemptive.c:134: if(threadMask == 0x0F){
      0001C7 74 0F            [12]  464 	mov	a,#0x0f
      0001C9 B5 2A 04         [24]  465 	cjne	a,_threadMask,00102$
                                    466 ;	preemptive.c:135: return -1;
      0001CC 75 82 FF         [24]  467 	mov	dpl, #0xff
      0001CF 22               [24]  468 	ret
      0001D0                        469 00102$:
                                    470 ;	preemptive.c:176: for(i = 0; i != MAXTHREADS; i++){
      0001D0 75 2B 00         [24]  471 	mov	_i,#0x00
      0001D3                        472 00107$:
      0001D3 74 04            [12]  473 	mov	a,#0x04
      0001D5 B5 2B 02         [24]  474 	cjne	a,_i,00137$
      0001D8 80 29            [24]  475 	sjmp	00105$
      0001DA                        476 00137$:
                                    477 ;	preemptive.c:178: temp = 1;
      0001DA 75 2E 01         [24]  478 	mov	_temp,#0x01
                                    479 ;	preemptive.c:179: temp <<= i;
      0001DD 85 2B F0         [24]  480 	mov	b,_i
      0001E0 05 F0            [12]  481 	inc	b
      0001E2 E5 2E            [12]  482 	mov	a,_temp
      0001E4 80 02            [24]  483 	sjmp	00139$
      0001E6                        484 00138$:
      0001E6 25 E0            [12]  485 	add	a,acc
      0001E8                        486 00139$:
      0001E8 D5 F0 FB         [24]  487 	djnz	b,00138$
      0001EB F5 2E            [12]  488 	mov	_temp,a
                                    489 ;	preemptive.c:180: if(!(threadMask & temp)){
      0001ED E5 2E            [12]  490 	mov	a,_temp
      0001EF 55 2A            [12]  491 	anl	a,_threadMask
      0001F1 70 09            [24]  492 	jnz	00108$
                                    493 ;	preemptive.c:182: threadMask |= temp;
      0001F3 E5 2E            [12]  494 	mov	a,_temp
      0001F5 42 2A            [12]  495 	orl	_threadMask,a
                                    496 ;	preemptive.c:183: newThread = i;
      0001F7 85 2B 2D         [24]  497 	mov	_newThread,_i
                                    498 ;	preemptive.c:184: break;
      0001FA 80 07            [24]  499 	sjmp	00105$
      0001FC                        500 00108$:
                                    501 ;	preemptive.c:176: for(i = 0; i != MAXTHREADS; i++){
      0001FC E5 2B            [12]  502 	mov	a,_i
      0001FE 04               [12]  503 	inc	a
      0001FF F5 2B            [12]  504 	mov	_i,a
      000201 80 D0            [24]  505 	sjmp	00107$
      000203                        506 00105$:
                                    507 ;	preemptive.c:188: tempSP = SP;
      000203 85 81 2C         [24]  508 	mov	_tempSP,_SP
                                    509 ;	preemptive.c:191: SP = (0x3F) + newThread * (0x10);
      000206 E5 2D            [12]  510 	mov	a,_newThread
      000208 C4               [12]  511 	swap	a
      000209 54 F0            [12]  512 	anl	a,#0xf0
      00020B FF               [12]  513 	mov	r7,a
      00020C 24 3F            [12]  514 	add	a,#0x3f
      00020E F5 81            [12]  515 	mov	_SP,a
                                    516 ;	preemptive.c:196: __endasm;
      000210 C0 82            [24]  517 	PUSH	DPL
      000212 C0 83            [24]  518 	PUSH	DPH
                                    519 ;	preemptive.c:204: __endasm;
      000214 54 00            [12]  520 	ANL	A, #0
      000216 C0 E0            [24]  521 	PUSH	ACC
      000218 C0 E0            [24]  522 	PUSH	ACC
      00021A C0 E0            [24]  523 	PUSH	ACC
      00021C C0 E0            [24]  524 	PUSH	ACC
                                    525 ;	preemptive.c:206: PSW = (newThread << 3);
      00021E E5 2D            [12]  526 	mov	a,_newThread
      000220 FF               [12]  527 	mov	r7,a
      000221 C4               [12]  528 	swap	a
      000222 03               [12]  529 	rr	a
      000223 54 F8            [12]  530 	anl	a,#0xf8
      000225 F5 D0            [12]  531 	mov	_PSW,a
                                    532 ;	preemptive.c:209: __endasm;
      000227 C0 D0            [24]  533 	PUSH	PSW
                                    534 ;	preemptive.c:211: savedSP[newThread] = SP;
      000229 E5 2D            [12]  535 	mov	a,_newThread
      00022B 24 25            [12]  536 	add	a, #_savedSP
      00022D F8               [12]  537 	mov	r0,a
      00022E A6 81            [24]  538 	mov	@r0,_SP
                                    539 ;	preemptive.c:213: SP = tempSP;
      000230 85 2C 81         [24]  540 	mov	_SP,_tempSP
                                    541 ;	preemptive.c:215: EA = 1;
                                    542 ;	assignBit
      000233 D2 AF            [12]  543 	setb	_EA
                                    544 ;	preemptive.c:216: return newThread;
      000235 85 2D 82         [24]  545 	mov	dpl, _newThread
                                    546 ;	preemptive.c:217: }
      000238 22               [24]  547 	ret
                                    548 ;------------------------------------------------------------
                                    549 ;Allocation info for local variables in function 'ThreadYield'
                                    550 ;------------------------------------------------------------
                                    551 ;	preemptive.c:226: void ThreadYield(void){
                                    552 ;	-----------------------------------------
                                    553 ;	 function ThreadYield
                                    554 ;	-----------------------------------------
      000239                        555 _ThreadYield:
                                    556 ;	preemptive.c:227: EA = 0;
                                    557 ;	assignBit
      000239 C2 AF            [12]  558 	clr	_EA
                                    559 ;	preemptive.c:228: SAVESTATE;
      00023B C0 E0            [24]  560 	PUSH ACC 
      00023D C0 F0            [24]  561 	PUSH B 
      00023F C0 82            [24]  562 	PUSH DPL 
      000241 C0 83            [24]  563 	PUSH DPH 
      000243 C0 D0            [24]  564 	PUSH PSW 
      000245 E5 29            [12]  565 	mov	a,_currentThread
      000247 24 25            [12]  566 	add	a, #_savedSP
      000249 F8               [12]  567 	mov	r0,a
      00024A A6 81            [24]  568 	mov	@r0,_SP
                                    569 ;	preemptive.c:229: do{
      00024C                        570 00103$:
                                    571 ;	preemptive.c:240: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      00024C 74 FD            [12]  572 	mov	a,#0x100 - 0x03
      00024E 25 29            [12]  573 	add	a,_currentThread
      000250 40 0B            [24]  574 	jc	00108$
      000252 AF 29            [24]  575 	mov	r7,_currentThread
      000254 0F               [12]  576 	inc	r7
      000255 EF               [12]  577 	mov	a,r7
      000256 FE               [12]  578 	mov	r6,a
      000257 33               [12]  579 	rlc	a
      000258 95 E0            [12]  580 	subb	a,acc
      00025A FF               [12]  581 	mov	r7,a
      00025B 80 04            [24]  582 	sjmp	00109$
      00025D                        583 00108$:
      00025D 7E 00            [12]  584 	mov	r6,#0x00
      00025F 7F 00            [12]  585 	mov	r7,#0x00
      000261                        586 00109$:
      000261 8E 29            [24]  587 	mov	_currentThread,r6
                                    588 ;	preemptive.c:241: temp = 1 << currentThread;
      000263 85 29 F0         [24]  589 	mov	b,_currentThread
      000266 05 F0            [12]  590 	inc	b
      000268 74 01            [12]  591 	mov	a,#0x01
      00026A 80 02            [24]  592 	sjmp	00130$
      00026C                        593 00129$:
      00026C 25 E0            [12]  594 	add	a,acc
      00026E                        595 00130$:
      00026E D5 F0 FB         [24]  596 	djnz	b,00129$
      000271 F5 2E            [12]  597 	mov	_temp,a
                                    598 ;	preemptive.c:242: if (threadMask & temp){
      000273 E5 2E            [12]  599 	mov	a,_temp
      000275 55 2A            [12]  600 	anl	a,_threadMask
      000277 60 D3            [24]  601 	jz	00103$
                                    602 ;	preemptive.c:247: EA = 1;
                                    603 ;	assignBit
      000279 D2 AF            [12]  604 	setb	_EA
                                    605 ;	preemptive.c:248: RESTORESTATE;
      00027B E5 29            [12]  606 	mov	a,_currentThread
      00027D 24 25            [12]  607 	add	a, #_savedSP
      00027F F9               [12]  608 	mov	r1,a
      000280 87 81            [24]  609 	mov	_SP,@r1
      000282 D0 D0            [24]  610 	POP PSW 
      000284 D0 83            [24]  611 	POP DPH 
      000286 D0 82            [24]  612 	POP DPL 
      000288 D0 F0            [24]  613 	POP B 
      00028A D0 E0            [24]  614 	POP ACC 
                                    615 ;	preemptive.c:249: }
      00028C 22               [24]  616 	ret
                                    617 ;------------------------------------------------------------
                                    618 ;Allocation info for local variables in function 'ThreadExit'
                                    619 ;------------------------------------------------------------
                                    620 ;	preemptive.c:255: void ThreadExit(void)
                                    621 ;	-----------------------------------------
                                    622 ;	 function ThreadExit
                                    623 ;	-----------------------------------------
      00028D                        624 _ThreadExit:
                                    625 ;	preemptive.c:263: EA = 0;
                                    626 ;	assignBit
      00028D C2 AF            [12]  627 	clr	_EA
                                    628 ;	preemptive.c:264: temp = 1 << currentThread;
      00028F 85 29 F0         [24]  629 	mov	b,_currentThread
      000292 05 F0            [12]  630 	inc	b
      000294 74 01            [12]  631 	mov	a,#0x01
      000296 80 02            [24]  632 	sjmp	00136$
      000298                        633 00135$:
      000298 25 E0            [12]  634 	add	a,acc
      00029A                        635 00136$:
      00029A D5 F0 FB         [24]  636 	djnz	b,00135$
      00029D F5 2E            [12]  637 	mov	_temp,a
                                    638 ;	preemptive.c:265: threadMask ^= temp;
      00029F E5 2E            [12]  639 	mov	a,_temp
      0002A1 62 2A            [12]  640 	xrl	_threadMask,a
                                    641 ;	preemptive.c:266: for(i = 0; i < MAXTHREADS; i++){
      0002A3 75 2B 00         [24]  642 	mov	_i,#0x00
      0002A6                        643 00107$:
      0002A6 74 FC            [12]  644 	mov	a,#0x100 - 0x04
      0002A8 25 2B            [12]  645 	add	a,_i
      0002AA 40 22            [24]  646 	jc	00103$
                                    647 ;	preemptive.c:267: temp = 1 << i;
      0002AC 85 2B F0         [24]  648 	mov	b,_i
      0002AF 05 F0            [12]  649 	inc	b
      0002B1 74 01            [12]  650 	mov	a,#0x01
      0002B3 80 02            [24]  651 	sjmp	00139$
      0002B5                        652 00138$:
      0002B5 25 E0            [12]  653 	add	a,acc
      0002B7                        654 00139$:
      0002B7 D5 F0 FB         [24]  655 	djnz	b,00138$
      0002BA F5 2E            [12]  656 	mov	_temp,a
                                    657 ;	preemptive.c:268: if(temp & threadMask){
      0002BC E5 2A            [12]  658 	mov	a,_threadMask
      0002BE 55 2E            [12]  659 	anl	a,_temp
      0002C0 60 05            [24]  660 	jz	00108$
                                    661 ;	preemptive.c:269: currentThread = i;
      0002C2 85 2B 29         [24]  662 	mov	_currentThread,_i
                                    663 ;	preemptive.c:270: break;
      0002C5 80 07            [24]  664 	sjmp	00103$
      0002C7                        665 00108$:
                                    666 ;	preemptive.c:266: for(i = 0; i < MAXTHREADS; i++){
      0002C7 E5 2B            [12]  667 	mov	a,_i
      0002C9 04               [12]  668 	inc	a
      0002CA F5 2B            [12]  669 	mov	_i,a
      0002CC 80 D8            [24]  670 	sjmp	00107$
      0002CE                        671 00103$:
                                    672 ;	preemptive.c:273: if (i == MAXTHREADS){
      0002CE 74 04            [12]  673 	mov	a,#0x04
      0002D0 B5 2B 03         [24]  674 	cjne	a,_i,00105$
                                    675 ;	preemptive.c:274: currentThread = -1;
      0002D3 75 29 FF         [24]  676 	mov	_currentThread,#0xff
      0002D6                        677 00105$:
                                    678 ;	preemptive.c:276: RESTORESTATE;
      0002D6 E5 29            [12]  679 	mov	a,_currentThread
      0002D8 24 25            [12]  680 	add	a, #_savedSP
      0002DA F9               [12]  681 	mov	r1,a
      0002DB 87 81            [24]  682 	mov	_SP,@r1
      0002DD D0 D0            [24]  683 	POP PSW 
      0002DF D0 83            [24]  684 	POP DPH 
      0002E1 D0 82            [24]  685 	POP DPL 
      0002E3 D0 F0            [24]  686 	POP B 
      0002E5 D0 E0            [24]  687 	POP ACC 
                                    688 ;	preemptive.c:277: EA = 1;
                                    689 ;	assignBit
      0002E7 D2 AF            [12]  690 	setb	_EA
                                    691 ;	preemptive.c:278: }
      0002E9 22               [24]  692 	ret
                                    693 	.area CSEG    (CODE)
                                    694 	.area CONST   (CODE)
                                    695 	.area XINIT   (CODE)
                                    696 	.area CABS    (ABS,CODE)
