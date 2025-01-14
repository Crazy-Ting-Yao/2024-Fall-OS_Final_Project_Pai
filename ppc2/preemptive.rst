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
                                    110 	.globl _temp
                                    111 	.globl _newThread
                                    112 	.globl _tempSP
                                    113 	.globl _i
                                    114 	.globl _threadMask
                                    115 	.globl _currentThread
                                    116 	.globl _savedSP
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _savedSP	=	0x0030
                           000034   236 _currentThread	=	0x0034
                           000035   237 _threadMask	=	0x0035
                           000036   238 _i	=	0x0036
                           000037   239 _tempSP	=	0x0037
                           000038   240 _newThread	=	0x0038
                           000039   241 _temp	=	0x0039
                                    242 ;--------------------------------------------------------
                                    243 ; overlayable items in internal ram
                                    244 ;--------------------------------------------------------
                                    245 	.area	OSEG    (OVR,DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; indirectly addressable internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area ISEG    (DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area IABS    (ABS,DATA)
                                    254 	.area IABS    (ABS,DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; bit data
                                    257 ;--------------------------------------------------------
                                    258 	.area BSEG    (BIT)
      000002                        259 _ThreadCreate_sloc0_1_0:
      000002                        260 	.ds 1
      000003                        261 _ThreadYield_sloc0_1_0:
      000003                        262 	.ds 1
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
                                    308 ;	preemptive.c:80: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      000088                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:81: threadMask = 0;
      000088 75 35 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:82: TMOD = 0; // timer 0 mode 0
      00008B 75 89 00         [24]  324 	mov	_TMOD,#0x00
                                    325 ;	preemptive.c:85: IE = 0x82; // enable timer 0 interrupt,
      00008E 75 A8 82         [24]  326 	mov	_IE,#0x82
                                    327 ;	preemptive.c:86: TR0 = 1; // start running timer0
                                    328 ;	assignBit
      000091 D2 8C            [12]  329 	setb	_TR0
                                    330 ;	preemptive.c:87: currentThread = ThreadCreate(main);
      000093 90 00 71         [24]  331 	mov	dptr,#_main
      000096 12 01 03         [24]  332 	lcall	_ThreadCreate
      000099 85 82 34         [24]  333 	mov	_currentThread,dpl
                                    334 ;	preemptive.c:88: RESTORESTATE;
      00009C E5 34            [12]  335 	mov	a,_currentThread
      00009E 24 30            [12]  336 	add	a, #_savedSP
      0000A0 F9               [12]  337 	mov	r1,a
      0000A1 87 81            [24]  338 	mov	_SP,@r1
      0000A3 D0 D0            [24]  339 	POP PSW 
      0000A5 D0 83            [24]  340 	POP DPH 
      0000A7 D0 82            [24]  341 	POP DPL 
      0000A9 D0 F0            [24]  342 	POP B 
      0000AB D0 E0            [24]  343 	POP ACC 
                                    344 ;	preemptive.c:89: }
      0000AD 22               [24]  345 	ret
                                    346 ;------------------------------------------------------------
                                    347 ;Allocation info for local variables in function 'myTimer0Handler'
                                    348 ;------------------------------------------------------------
                                    349 ;	preemptive.c:97: void myTimer0Handler(void) {
                                    350 ;	-----------------------------------------
                                    351 ;	 function myTimer0Handler
                                    352 ;	-----------------------------------------
      0000AE                        353 _myTimer0Handler:
                                    354 ;	preemptive.c:98: EA = 0; // don't do __critial
                                    355 ;	assignBit
      0000AE C2 AF            [12]  356 	clr	_EA
                                    357 ;	preemptive.c:99: SAVESTATE;
      0000B0 C0 E0            [24]  358 	PUSH ACC 
      0000B2 C0 F0            [24]  359 	PUSH B 
      0000B4 C0 82            [24]  360 	PUSH DPL 
      0000B6 C0 83            [24]  361 	PUSH DPH 
      0000B8 C0 D0            [24]  362 	PUSH PSW 
      0000BA E5 34            [12]  363 	mov	a,_currentThread
      0000BC 24 30            [12]  364 	add	a, #_savedSP
      0000BE F8               [12]  365 	mov	r0,a
      0000BF A6 81            [24]  366 	mov	@r0,_SP
                                    367 ;	preemptive.c:101: do{
      0000C1                        368 00103$:
                                    369 ;	preemptive.c:102: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0000C1 74 FD            [12]  370 	mov	a,#0x100 - 0x03
      0000C3 25 34            [12]  371 	add	a,_currentThread
      0000C5 40 0B            [24]  372 	jc	00108$
      0000C7 AF 34            [24]  373 	mov	r7,_currentThread
      0000C9 0F               [12]  374 	inc	r7
      0000CA EF               [12]  375 	mov	a,r7
      0000CB FE               [12]  376 	mov	r6,a
      0000CC 33               [12]  377 	rlc	a
      0000CD 95 E0            [12]  378 	subb	a,acc
      0000CF FF               [12]  379 	mov	r7,a
      0000D0 80 04            [24]  380 	sjmp	00109$
      0000D2                        381 00108$:
      0000D2 7E 00            [12]  382 	mov	r6,#0x00
      0000D4 7F 00            [12]  383 	mov	r7,#0x00
      0000D6                        384 00109$:
      0000D6 8E 34            [24]  385 	mov	_currentThread,r6
                                    386 ;	preemptive.c:103: temp = 1 << currentThread;
      0000D8 85 34 F0         [24]  387 	mov	b,_currentThread
      0000DB 05 F0            [12]  388 	inc	b
      0000DD 74 01            [12]  389 	mov	a,#0x01
      0000DF 80 02            [24]  390 	sjmp	00130$
      0000E1                        391 00129$:
      0000E1 25 E0            [12]  392 	add	a,acc
      0000E3                        393 00130$:
      0000E3 D5 F0 FB         [24]  394 	djnz	b,00129$
      0000E6 F5 39            [12]  395 	mov	_temp,a
                                    396 ;	preemptive.c:104: if (threadMask & temp){
      0000E8 E5 39            [12]  397 	mov	a,_temp
      0000EA 55 35            [12]  398 	anl	a,_threadMask
      0000EC 60 D3            [24]  399 	jz	00103$
                                    400 ;	preemptive.c:108: RESTORESTATE;
      0000EE E5 34            [12]  401 	mov	a,_currentThread
      0000F0 24 30            [12]  402 	add	a, #_savedSP
      0000F2 F9               [12]  403 	mov	r1,a
      0000F3 87 81            [24]  404 	mov	_SP,@r1
      0000F5 D0 D0            [24]  405 	POP PSW 
      0000F7 D0 83            [24]  406 	POP DPH 
      0000F9 D0 82            [24]  407 	POP DPL 
      0000FB D0 F0            [24]  408 	POP B 
      0000FD D0 E0            [24]  409 	POP ACC 
                                    410 ;	preemptive.c:111: EA = 1;
                                    411 ;	assignBit
      0000FF D2 AF            [12]  412 	setb	_EA
                                    413 ;	preemptive.c:114: __endasm;
      000101 32               [24]  414 	RETI
                                    415 ;	preemptive.c:115: }
      000102 22               [24]  416 	ret
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'ThreadCreate'
                                    419 ;------------------------------------------------------------
                                    420 ;fp                        Allocated to registers 
                                    421 ;------------------------------------------------------------
                                    422 ;	preemptive.c:117: ThreadID ThreadCreate(FunctionPtr fp){
                                    423 ;	-----------------------------------------
                                    424 ;	 function ThreadCreate
                                    425 ;	-----------------------------------------
      000103                        426 _ThreadCreate:
                                    427 ;	preemptive.c:123: if(threadMask == 0x0F){
      000103 74 0F            [12]  428 	mov	a,#0x0f
      000105 B5 35 04         [24]  429 	cjne	a,_threadMask,00102$
                                    430 ;	preemptive.c:124: return -1;
      000108 75 82 FF         [24]  431 	mov	dpl, #0xff
      00010B 22               [24]  432 	ret
      00010C                        433 00102$:
                                    434 ;	preemptive.c:204: }
      00010C D2 02            [12]  435 	setb	_ThreadCreate_sloc0_1_0
      00010E 10 AF 02         [24]  436 	jbc	ea,00137$
      000111 C2 02            [12]  437 	clr	_ThreadCreate_sloc0_1_0
      000113                        438 00137$:
                                    439 ;	preemptive.c:166: for(i = 0; i != MAXTHREADS; i++){
      000113 75 36 00         [24]  440 	mov	_i,#0x00
      000116                        441 00107$:
      000116 74 04            [12]  442 	mov	a,#0x04
      000118 B5 36 02         [24]  443 	cjne	a,_i,00138$
      00011B 80 29            [24]  444 	sjmp	00105$
      00011D                        445 00138$:
                                    446 ;	preemptive.c:168: temp = 1;
      00011D 75 39 01         [24]  447 	mov	_temp,#0x01
                                    448 ;	preemptive.c:169: temp <<= i;
      000120 85 36 F0         [24]  449 	mov	b,_i
      000123 05 F0            [12]  450 	inc	b
      000125 E5 39            [12]  451 	mov	a,_temp
      000127 80 02            [24]  452 	sjmp	00140$
      000129                        453 00139$:
      000129 25 E0            [12]  454 	add	a,acc
      00012B                        455 00140$:
      00012B D5 F0 FB         [24]  456 	djnz	b,00139$
      00012E F5 39            [12]  457 	mov	_temp,a
                                    458 ;	preemptive.c:170: if(!(threadMask & temp)){
      000130 E5 39            [12]  459 	mov	a,_temp
      000132 55 35            [12]  460 	anl	a,_threadMask
      000134 70 09            [24]  461 	jnz	00108$
                                    462 ;	preemptive.c:172: threadMask |= temp;
      000136 E5 39            [12]  463 	mov	a,_temp
      000138 42 35            [12]  464 	orl	_threadMask,a
                                    465 ;	preemptive.c:173: newThread = i;
      00013A 85 36 38         [24]  466 	mov	_newThread,_i
                                    467 ;	preemptive.c:174: break;
      00013D 80 07            [24]  468 	sjmp	00105$
      00013F                        469 00108$:
                                    470 ;	preemptive.c:166: for(i = 0; i != MAXTHREADS; i++){
      00013F E5 36            [12]  471 	mov	a,_i
      000141 04               [12]  472 	inc	a
      000142 F5 36            [12]  473 	mov	_i,a
      000144 80 D0            [24]  474 	sjmp	00107$
      000146                        475 00105$:
                                    476 ;	preemptive.c:178: tempSP = SP;
      000146 85 81 37         [24]  477 	mov	_tempSP,_SP
                                    478 ;	preemptive.c:181: SP = (0x3F) + newThread * (0x10);
      000149 E5 38            [12]  479 	mov	a,_newThread
      00014B C4               [12]  480 	swap	a
      00014C 54 F0            [12]  481 	anl	a,#0xf0
      00014E FF               [12]  482 	mov	r7,a
      00014F 24 3F            [12]  483 	add	a,#0x3f
      000151 F5 81            [12]  484 	mov	_SP,a
                                    485 ;	preemptive.c:186: __endasm;
      000153 C0 82            [24]  486 	PUSH	DPL
      000155 C0 83            [24]  487 	PUSH	DPH
                                    488 ;	preemptive.c:194: __endasm;
      000157 54 00            [12]  489 	ANL	A, #0
      000159 C0 E0            [24]  490 	PUSH	ACC
      00015B C0 E0            [24]  491 	PUSH	ACC
      00015D C0 E0            [24]  492 	PUSH	ACC
      00015F C0 E0            [24]  493 	PUSH	ACC
                                    494 ;	preemptive.c:196: PSW = (newThread << 3);
      000161 E5 38            [12]  495 	mov	a,_newThread
      000163 FF               [12]  496 	mov	r7,a
      000164 C4               [12]  497 	swap	a
      000165 03               [12]  498 	rr	a
      000166 54 F8            [12]  499 	anl	a,#0xf8
      000168 F5 D0            [12]  500 	mov	_PSW,a
                                    501 ;	preemptive.c:199: __endasm;
      00016A C0 D0            [24]  502 	PUSH	PSW
                                    503 ;	preemptive.c:201: savedSP[newThread] = SP;
      00016C E5 38            [12]  504 	mov	a,_newThread
      00016E 24 30            [12]  505 	add	a, #_savedSP
      000170 F8               [12]  506 	mov	r0,a
      000171 A6 81            [24]  507 	mov	@r0,_SP
                                    508 ;	preemptive.c:203: SP = tempSP;
      000173 85 37 81         [24]  509 	mov	_SP,_tempSP
      000176 A2 02            [12]  510 	mov	c,_ThreadCreate_sloc0_1_0
      000178 92 AF            [24]  511 	mov	ea,c
                                    512 ;	preemptive.c:206: return newThread;
      00017A 85 38 82         [24]  513 	mov	dpl, _newThread
                                    514 ;	preemptive.c:207: }
      00017D 22               [24]  515 	ret
                                    516 ;------------------------------------------------------------
                                    517 ;Allocation info for local variables in function 'ThreadYield'
                                    518 ;------------------------------------------------------------
                                    519 ;	preemptive.c:216: void ThreadYield(void){
                                    520 ;	-----------------------------------------
                                    521 ;	 function ThreadYield
                                    522 ;	-----------------------------------------
      00017E                        523 _ThreadYield:
                                    524 ;	preemptive.c:238: }
      00017E D2 03            [12]  525 	setb	_ThreadYield_sloc0_1_0
      000180 10 AF 02         [24]  526 	jbc	ea,00128$
      000183 C2 03            [12]  527 	clr	_ThreadYield_sloc0_1_0
      000185                        528 00128$:
                                    529 ;	preemptive.c:218: SAVESTATE;
      000185 C0 E0            [24]  530 	PUSH ACC 
      000187 C0 F0            [24]  531 	PUSH B 
      000189 C0 82            [24]  532 	PUSH DPL 
      00018B C0 83            [24]  533 	PUSH DPH 
      00018D C0 D0            [24]  534 	PUSH PSW 
      00018F E5 34            [12]  535 	mov	a,_currentThread
      000191 24 30            [12]  536 	add	a, #_savedSP
      000193 F8               [12]  537 	mov	r0,a
      000194 A6 81            [24]  538 	mov	@r0,_SP
                                    539 ;	preemptive.c:219: do{
      000196                        540 00103$:
                                    541 ;	preemptive.c:230: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      000196 74 FD            [12]  542 	mov	a,#0x100 - 0x03
      000198 25 34            [12]  543 	add	a,_currentThread
      00019A 40 0B            [24]  544 	jc	00108$
      00019C AF 34            [24]  545 	mov	r7,_currentThread
      00019E 0F               [12]  546 	inc	r7
      00019F EF               [12]  547 	mov	a,r7
      0001A0 FE               [12]  548 	mov	r6,a
      0001A1 33               [12]  549 	rlc	a
      0001A2 95 E0            [12]  550 	subb	a,acc
      0001A4 FF               [12]  551 	mov	r7,a
      0001A5 80 04            [24]  552 	sjmp	00109$
      0001A7                        553 00108$:
      0001A7 7E 00            [12]  554 	mov	r6,#0x00
      0001A9 7F 00            [12]  555 	mov	r7,#0x00
      0001AB                        556 00109$:
      0001AB 8E 34            [24]  557 	mov	_currentThread,r6
                                    558 ;	preemptive.c:231: temp = 1 << currentThread;
      0001AD 85 34 F0         [24]  559 	mov	b,_currentThread
      0001B0 05 F0            [12]  560 	inc	b
      0001B2 74 01            [12]  561 	mov	a,#0x01
      0001B4 80 02            [24]  562 	sjmp	00131$
      0001B6                        563 00130$:
      0001B6 25 E0            [12]  564 	add	a,acc
      0001B8                        565 00131$:
      0001B8 D5 F0 FB         [24]  566 	djnz	b,00130$
      0001BB F5 39            [12]  567 	mov	_temp,a
                                    568 ;	preemptive.c:232: if (threadMask & temp){
      0001BD E5 39            [12]  569 	mov	a,_temp
      0001BF 55 35            [12]  570 	anl	a,_threadMask
      0001C1 60 D3            [24]  571 	jz	00103$
                                    572 ;	preemptive.c:237: RESTORESTATE;
      0001C3 E5 34            [12]  573 	mov	a,_currentThread
      0001C5 24 30            [12]  574 	add	a, #_savedSP
      0001C7 F9               [12]  575 	mov	r1,a
      0001C8 87 81            [24]  576 	mov	_SP,@r1
      0001CA D0 D0            [24]  577 	POP PSW 
      0001CC D0 83            [24]  578 	POP DPH 
      0001CE D0 82            [24]  579 	POP DPL 
      0001D0 D0 F0            [24]  580 	POP B 
      0001D2 D0 E0            [24]  581 	POP ACC 
      0001D4 A2 03            [12]  582 	mov	c,_ThreadYield_sloc0_1_0
      0001D6 92 AF            [24]  583 	mov	ea,c
                                    584 ;	preemptive.c:239: }
      0001D8 22               [24]  585 	ret
                                    586 ;------------------------------------------------------------
                                    587 ;Allocation info for local variables in function 'ThreadExit'
                                    588 ;------------------------------------------------------------
                                    589 ;	preemptive.c:245: void ThreadExit(void)
                                    590 ;	-----------------------------------------
                                    591 ;	 function ThreadExit
                                    592 ;	-----------------------------------------
      0001D9                        593 _ThreadExit:
                                    594 ;	preemptive.c:253: EA = 0;
                                    595 ;	assignBit
      0001D9 C2 AF            [12]  596 	clr	_EA
                                    597 ;	preemptive.c:254: temp = 1 << currentThread;
      0001DB 85 34 F0         [24]  598 	mov	b,_currentThread
      0001DE 05 F0            [12]  599 	inc	b
      0001E0 74 01            [12]  600 	mov	a,#0x01
      0001E2 80 02            [24]  601 	sjmp	00136$
      0001E4                        602 00135$:
      0001E4 25 E0            [12]  603 	add	a,acc
      0001E6                        604 00136$:
      0001E6 D5 F0 FB         [24]  605 	djnz	b,00135$
      0001E9 F5 39            [12]  606 	mov	_temp,a
                                    607 ;	preemptive.c:255: threadMask ^= temp;
      0001EB E5 39            [12]  608 	mov	a,_temp
      0001ED 62 35            [12]  609 	xrl	_threadMask,a
                                    610 ;	preemptive.c:256: for(i = 0; i < MAXTHREADS; i++){
      0001EF 75 36 00         [24]  611 	mov	_i,#0x00
      0001F2                        612 00107$:
      0001F2 74 FC            [12]  613 	mov	a,#0x100 - 0x04
      0001F4 25 36            [12]  614 	add	a,_i
      0001F6 40 22            [24]  615 	jc	00103$
                                    616 ;	preemptive.c:257: temp = 1 << i;
      0001F8 85 36 F0         [24]  617 	mov	b,_i
      0001FB 05 F0            [12]  618 	inc	b
      0001FD 74 01            [12]  619 	mov	a,#0x01
      0001FF 80 02            [24]  620 	sjmp	00139$
      000201                        621 00138$:
      000201 25 E0            [12]  622 	add	a,acc
      000203                        623 00139$:
      000203 D5 F0 FB         [24]  624 	djnz	b,00138$
      000206 F5 39            [12]  625 	mov	_temp,a
                                    626 ;	preemptive.c:258: if(temp & threadMask){
      000208 E5 35            [12]  627 	mov	a,_threadMask
      00020A 55 39            [12]  628 	anl	a,_temp
      00020C 60 05            [24]  629 	jz	00108$
                                    630 ;	preemptive.c:259: currentThread = i;
      00020E 85 36 34         [24]  631 	mov	_currentThread,_i
                                    632 ;	preemptive.c:260: break;
      000211 80 07            [24]  633 	sjmp	00103$
      000213                        634 00108$:
                                    635 ;	preemptive.c:256: for(i = 0; i < MAXTHREADS; i++){
      000213 E5 36            [12]  636 	mov	a,_i
      000215 04               [12]  637 	inc	a
      000216 F5 36            [12]  638 	mov	_i,a
      000218 80 D8            [24]  639 	sjmp	00107$
      00021A                        640 00103$:
                                    641 ;	preemptive.c:263: if (i == MAXTHREADS){
      00021A 74 04            [12]  642 	mov	a,#0x04
      00021C B5 36 03         [24]  643 	cjne	a,_i,00105$
                                    644 ;	preemptive.c:264: currentThread = -1;
      00021F 75 34 FF         [24]  645 	mov	_currentThread,#0xff
      000222                        646 00105$:
                                    647 ;	preemptive.c:266: RESTORESTATE;
      000222 E5 34            [12]  648 	mov	a,_currentThread
      000224 24 30            [12]  649 	add	a, #_savedSP
      000226 F9               [12]  650 	mov	r1,a
      000227 87 81            [24]  651 	mov	_SP,@r1
      000229 D0 D0            [24]  652 	POP PSW 
      00022B D0 83            [24]  653 	POP DPH 
      00022D D0 82            [24]  654 	POP DPL 
      00022F D0 F0            [24]  655 	POP B 
      000231 D0 E0            [24]  656 	POP ACC 
                                    657 ;	preemptive.c:267: EA = 1;
                                    658 ;	assignBit
      000233 D2 AF            [12]  659 	setb	_EA
                                    660 ;	preemptive.c:268: }
      000235 22               [24]  661 	ret
                                    662 	.area CSEG    (CODE)
                                    663 	.area CONST   (CODE)
                                    664 	.area XINIT   (CODE)
                                    665 	.area CABS    (ABS,CODE)
