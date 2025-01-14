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
                           000025   235 _savedSP	=	0x0025
                           000029   236 _currentThread	=	0x0029
                           00002A   237 _threadMask	=	0x002a
                           00002B   238 _i	=	0x002b
                           00002C   239 _tempSP	=	0x002c
                           00002D   240 _newThread	=	0x002d
                           00002E   241 _temp	=	0x002e
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
      000000                        259 _ThreadCreate_sloc0_1_0:
      000000                        260 	.ds 1
                                    261 ;--------------------------------------------------------
                                    262 ; paged external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area PSEG    (PAG,XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; uninitialized external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XSEG    (XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; absolute external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XABS    (ABS,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; initialized external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XISEG   (XDATA)
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT0 (CODE)
                                    279 	.area GSINIT1 (CODE)
                                    280 	.area GSINIT2 (CODE)
                                    281 	.area GSINIT3 (CODE)
                                    282 	.area GSINIT4 (CODE)
                                    283 	.area GSINIT5 (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area CSEG    (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; global & static initialisations
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; Home
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
                                    298 	.area HOME    (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; code
                                    301 ;--------------------------------------------------------
                                    302 	.area CSEG    (CODE)
                                    303 ;------------------------------------------------------------
                                    304 ;Allocation info for local variables in function 'Bootstrap'
                                    305 ;------------------------------------------------------------
                                    306 ;	preemptive.c:80: void Bootstrap(void) {
                                    307 ;	-----------------------------------------
                                    308 ;	 function Bootstrap
                                    309 ;	-----------------------------------------
      0000CC                        310 _Bootstrap:
                           000007   311 	ar7 = 0x07
                           000006   312 	ar6 = 0x06
                           000005   313 	ar5 = 0x05
                           000004   314 	ar4 = 0x04
                           000003   315 	ar3 = 0x03
                           000002   316 	ar2 = 0x02
                           000001   317 	ar1 = 0x01
                           000000   318 	ar0 = 0x00
                                    319 ;	preemptive.c:81: threadMask = 0;
      0000CC 75 2A 00         [24]  320 	mov	_threadMask,#0x00
                                    321 ;	preemptive.c:82: TMOD = 0; // timer 0 mode 0
      0000CF 75 89 00         [24]  322 	mov	_TMOD,#0x00
                                    323 ;	preemptive.c:85: IE = 0x82; // enable timer 0 interrupt,
      0000D2 75 A8 82         [24]  324 	mov	_IE,#0x82
                                    325 ;	preemptive.c:86: TR0 = 1; // start running timer0
                                    326 ;	assignBit
      0000D5 D2 8C            [12]  327 	setb	_TR0
                                    328 ;	preemptive.c:87: currentThread = ThreadCreate(main);
      0000D7 90 00 AF         [24]  329 	mov	dptr,#_main
      0000DA 12 01 47         [24]  330 	lcall	_ThreadCreate
      0000DD 85 82 29         [24]  331 	mov	_currentThread,dpl
                                    332 ;	preemptive.c:88: RESTORESTATE;
      0000E0 E5 29            [12]  333 	mov	a,_currentThread
      0000E2 24 25            [12]  334 	add	a, #_savedSP
      0000E4 F9               [12]  335 	mov	r1,a
      0000E5 87 81            [24]  336 	mov	_SP,@r1
      0000E7 D0 D0            [24]  337 	POP PSW 
      0000E9 D0 83            [24]  338 	POP DPH 
      0000EB D0 82            [24]  339 	POP DPL 
      0000ED D0 F0            [24]  340 	POP B 
      0000EF D0 E0            [24]  341 	POP ACC 
                                    342 ;	preemptive.c:89: }
      0000F1 22               [24]  343 	ret
                                    344 ;------------------------------------------------------------
                                    345 ;Allocation info for local variables in function 'myTimer0Handler'
                                    346 ;------------------------------------------------------------
                                    347 ;	preemptive.c:97: void myTimer0Handler(void) {
                                    348 ;	-----------------------------------------
                                    349 ;	 function myTimer0Handler
                                    350 ;	-----------------------------------------
      0000F2                        351 _myTimer0Handler:
                                    352 ;	preemptive.c:98: EA = 0; // don't do __critial
                                    353 ;	assignBit
      0000F2 C2 AF            [12]  354 	clr	_EA
                                    355 ;	preemptive.c:99: SAVESTATE;
      0000F4 C0 E0            [24]  356 	PUSH ACC 
      0000F6 C0 F0            [24]  357 	PUSH B 
      0000F8 C0 82            [24]  358 	PUSH DPL 
      0000FA C0 83            [24]  359 	PUSH DPH 
      0000FC C0 D0            [24]  360 	PUSH PSW 
      0000FE E5 29            [12]  361 	mov	a,_currentThread
      000100 24 25            [12]  362 	add	a, #_savedSP
      000102 F8               [12]  363 	mov	r0,a
      000103 A6 81            [24]  364 	mov	@r0,_SP
                                    365 ;	preemptive.c:101: do{
      000105                        366 00103$:
                                    367 ;	preemptive.c:102: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      000105 74 FD            [12]  368 	mov	a,#0x100 - 0x03
      000107 25 29            [12]  369 	add	a,_currentThread
      000109 40 0B            [24]  370 	jc	00108$
      00010B AF 29            [24]  371 	mov	r7,_currentThread
      00010D 0F               [12]  372 	inc	r7
      00010E EF               [12]  373 	mov	a,r7
      00010F FE               [12]  374 	mov	r6,a
      000110 33               [12]  375 	rlc	a
      000111 95 E0            [12]  376 	subb	a,acc
      000113 FF               [12]  377 	mov	r7,a
      000114 80 04            [24]  378 	sjmp	00109$
      000116                        379 00108$:
      000116 7E 00            [12]  380 	mov	r6,#0x00
      000118 7F 00            [12]  381 	mov	r7,#0x00
      00011A                        382 00109$:
      00011A 8E 29            [24]  383 	mov	_currentThread,r6
                                    384 ;	preemptive.c:103: temp = 1 << currentThread;
      00011C 85 29 F0         [24]  385 	mov	b,_currentThread
      00011F 05 F0            [12]  386 	inc	b
      000121 74 01            [12]  387 	mov	a,#0x01
      000123 80 02            [24]  388 	sjmp	00130$
      000125                        389 00129$:
      000125 25 E0            [12]  390 	add	a,acc
      000127                        391 00130$:
      000127 D5 F0 FB         [24]  392 	djnz	b,00129$
      00012A F5 2E            [12]  393 	mov	_temp,a
                                    394 ;	preemptive.c:104: if (threadMask & temp){
      00012C E5 2E            [12]  395 	mov	a,_temp
      00012E 55 2A            [12]  396 	anl	a,_threadMask
      000130 60 D3            [24]  397 	jz	00103$
                                    398 ;	preemptive.c:108: RESTORESTATE;
      000132 E5 29            [12]  399 	mov	a,_currentThread
      000134 24 25            [12]  400 	add	a, #_savedSP
      000136 F9               [12]  401 	mov	r1,a
      000137 87 81            [24]  402 	mov	_SP,@r1
      000139 D0 D0            [24]  403 	POP PSW 
      00013B D0 83            [24]  404 	POP DPH 
      00013D D0 82            [24]  405 	POP DPL 
      00013F D0 F0            [24]  406 	POP B 
      000141 D0 E0            [24]  407 	POP ACC 
                                    408 ;	preemptive.c:111: EA = 1;
                                    409 ;	assignBit
      000143 D2 AF            [12]  410 	setb	_EA
                                    411 ;	preemptive.c:114: __endasm;
      000145 32               [24]  412 	RETI
                                    413 ;	preemptive.c:115: }
      000146 22               [24]  414 	ret
                                    415 ;------------------------------------------------------------
                                    416 ;Allocation info for local variables in function 'ThreadCreate'
                                    417 ;------------------------------------------------------------
                                    418 ;fp                        Allocated to registers 
                                    419 ;------------------------------------------------------------
                                    420 ;	preemptive.c:117: ThreadID ThreadCreate(FunctionPtr fp){
                                    421 ;	-----------------------------------------
                                    422 ;	 function ThreadCreate
                                    423 ;	-----------------------------------------
      000147                        424 _ThreadCreate:
                                    425 ;	preemptive.c:123: if(threadMask == 0x0F){
      000147 74 0F            [12]  426 	mov	a,#0x0f
      000149 B5 2A 04         [24]  427 	cjne	a,_threadMask,00102$
                                    428 ;	preemptive.c:124: return -1;
      00014C 75 82 FF         [24]  429 	mov	dpl, #0xff
      00014F 22               [24]  430 	ret
      000150                        431 00102$:
                                    432 ;	preemptive.c:204: }
      000150 D2 00            [12]  433 	setb	_ThreadCreate_sloc0_1_0
      000152 10 AF 02         [24]  434 	jbc	ea,00137$
      000155 C2 00            [12]  435 	clr	_ThreadCreate_sloc0_1_0
      000157                        436 00137$:
                                    437 ;	preemptive.c:166: for(i = 0; i != MAXTHREADS; i++){
      000157 75 2B 00         [24]  438 	mov	_i,#0x00
      00015A                        439 00107$:
      00015A 74 04            [12]  440 	mov	a,#0x04
      00015C B5 2B 02         [24]  441 	cjne	a,_i,00138$
      00015F 80 29            [24]  442 	sjmp	00105$
      000161                        443 00138$:
                                    444 ;	preemptive.c:168: temp = 1;
      000161 75 2E 01         [24]  445 	mov	_temp,#0x01
                                    446 ;	preemptive.c:169: temp <<= i;
      000164 85 2B F0         [24]  447 	mov	b,_i
      000167 05 F0            [12]  448 	inc	b
      000169 E5 2E            [12]  449 	mov	a,_temp
      00016B 80 02            [24]  450 	sjmp	00140$
      00016D                        451 00139$:
      00016D 25 E0            [12]  452 	add	a,acc
      00016F                        453 00140$:
      00016F D5 F0 FB         [24]  454 	djnz	b,00139$
      000172 F5 2E            [12]  455 	mov	_temp,a
                                    456 ;	preemptive.c:170: if(!(threadMask & temp)){
      000174 E5 2E            [12]  457 	mov	a,_temp
      000176 55 2A            [12]  458 	anl	a,_threadMask
      000178 70 09            [24]  459 	jnz	00108$
                                    460 ;	preemptive.c:172: threadMask |= temp;
      00017A E5 2E            [12]  461 	mov	a,_temp
      00017C 42 2A            [12]  462 	orl	_threadMask,a
                                    463 ;	preemptive.c:173: newThread = i;
      00017E 85 2B 2D         [24]  464 	mov	_newThread,_i
                                    465 ;	preemptive.c:174: break;
      000181 80 07            [24]  466 	sjmp	00105$
      000183                        467 00108$:
                                    468 ;	preemptive.c:166: for(i = 0; i != MAXTHREADS; i++){
      000183 E5 2B            [12]  469 	mov	a,_i
      000185 04               [12]  470 	inc	a
      000186 F5 2B            [12]  471 	mov	_i,a
      000188 80 D0            [24]  472 	sjmp	00107$
      00018A                        473 00105$:
                                    474 ;	preemptive.c:178: tempSP = SP;
      00018A 85 81 2C         [24]  475 	mov	_tempSP,_SP
                                    476 ;	preemptive.c:181: SP = (0x3F) + newThread * (0x10);
      00018D E5 2D            [12]  477 	mov	a,_newThread
      00018F C4               [12]  478 	swap	a
      000190 54 F0            [12]  479 	anl	a,#0xf0
      000192 FF               [12]  480 	mov	r7,a
      000193 24 3F            [12]  481 	add	a,#0x3f
      000195 F5 81            [12]  482 	mov	_SP,a
                                    483 ;	preemptive.c:186: __endasm;
      000197 C0 82            [24]  484 	PUSH	DPL
      000199 C0 83            [24]  485 	PUSH	DPH
                                    486 ;	preemptive.c:194: __endasm;
      00019B 54 00            [12]  487 	ANL	A, #0
      00019D C0 E0            [24]  488 	PUSH	ACC
      00019F C0 E0            [24]  489 	PUSH	ACC
      0001A1 C0 E0            [24]  490 	PUSH	ACC
      0001A3 C0 E0            [24]  491 	PUSH	ACC
                                    492 ;	preemptive.c:196: PSW = (newThread << 3);
      0001A5 E5 2D            [12]  493 	mov	a,_newThread
      0001A7 FF               [12]  494 	mov	r7,a
      0001A8 C4               [12]  495 	swap	a
      0001A9 03               [12]  496 	rr	a
      0001AA 54 F8            [12]  497 	anl	a,#0xf8
      0001AC F5 D0            [12]  498 	mov	_PSW,a
                                    499 ;	preemptive.c:199: __endasm;
      0001AE C0 D0            [24]  500 	PUSH	PSW
                                    501 ;	preemptive.c:201: savedSP[newThread] = SP;
      0001B0 E5 2D            [12]  502 	mov	a,_newThread
      0001B2 24 25            [12]  503 	add	a, #_savedSP
      0001B4 F8               [12]  504 	mov	r0,a
      0001B5 A6 81            [24]  505 	mov	@r0,_SP
                                    506 ;	preemptive.c:203: SP = tempSP;
      0001B7 85 2C 81         [24]  507 	mov	_SP,_tempSP
      0001BA A2 00            [12]  508 	mov	c,_ThreadCreate_sloc0_1_0
      0001BC 92 AF            [24]  509 	mov	ea,c
                                    510 ;	preemptive.c:206: return newThread;
      0001BE 85 2D 82         [24]  511 	mov	dpl, _newThread
                                    512 ;	preemptive.c:207: }
      0001C1 22               [24]  513 	ret
                                    514 ;------------------------------------------------------------
                                    515 ;Allocation info for local variables in function 'ThreadYield'
                                    516 ;------------------------------------------------------------
                                    517 ;	preemptive.c:216: void ThreadYield(void){
                                    518 ;	-----------------------------------------
                                    519 ;	 function ThreadYield
                                    520 ;	-----------------------------------------
      0001C2                        521 _ThreadYield:
                                    522 ;	preemptive.c:217: EA = 0;
                                    523 ;	assignBit
      0001C2 C2 AF            [12]  524 	clr	_EA
                                    525 ;	preemptive.c:218: SAVESTATE;
      0001C4 C0 E0            [24]  526 	PUSH ACC 
      0001C6 C0 F0            [24]  527 	PUSH B 
      0001C8 C0 82            [24]  528 	PUSH DPL 
      0001CA C0 83            [24]  529 	PUSH DPH 
      0001CC C0 D0            [24]  530 	PUSH PSW 
      0001CE E5 29            [12]  531 	mov	a,_currentThread
      0001D0 24 25            [12]  532 	add	a, #_savedSP
      0001D2 F8               [12]  533 	mov	r0,a
      0001D3 A6 81            [24]  534 	mov	@r0,_SP
                                    535 ;	preemptive.c:219: do{
      0001D5                        536 00103$:
                                    537 ;	preemptive.c:230: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0001D5 74 FD            [12]  538 	mov	a,#0x100 - 0x03
      0001D7 25 29            [12]  539 	add	a,_currentThread
      0001D9 40 0B            [24]  540 	jc	00108$
      0001DB AF 29            [24]  541 	mov	r7,_currentThread
      0001DD 0F               [12]  542 	inc	r7
      0001DE EF               [12]  543 	mov	a,r7
      0001DF FE               [12]  544 	mov	r6,a
      0001E0 33               [12]  545 	rlc	a
      0001E1 95 E0            [12]  546 	subb	a,acc
      0001E3 FF               [12]  547 	mov	r7,a
      0001E4 80 04            [24]  548 	sjmp	00109$
      0001E6                        549 00108$:
      0001E6 7E 00            [12]  550 	mov	r6,#0x00
      0001E8 7F 00            [12]  551 	mov	r7,#0x00
      0001EA                        552 00109$:
      0001EA 8E 29            [24]  553 	mov	_currentThread,r6
                                    554 ;	preemptive.c:231: temp = 1 << currentThread;
      0001EC 85 29 F0         [24]  555 	mov	b,_currentThread
      0001EF 05 F0            [12]  556 	inc	b
      0001F1 74 01            [12]  557 	mov	a,#0x01
      0001F3 80 02            [24]  558 	sjmp	00130$
      0001F5                        559 00129$:
      0001F5 25 E0            [12]  560 	add	a,acc
      0001F7                        561 00130$:
      0001F7 D5 F0 FB         [24]  562 	djnz	b,00129$
      0001FA F5 2E            [12]  563 	mov	_temp,a
                                    564 ;	preemptive.c:232: if (threadMask & temp){
      0001FC E5 2E            [12]  565 	mov	a,_temp
      0001FE 55 2A            [12]  566 	anl	a,_threadMask
      000200 60 D3            [24]  567 	jz	00103$
                                    568 ;	preemptive.c:237: EA = 1;
                                    569 ;	assignBit
      000202 D2 AF            [12]  570 	setb	_EA
                                    571 ;	preemptive.c:238: RESTORESTATE;
      000204 E5 29            [12]  572 	mov	a,_currentThread
      000206 24 25            [12]  573 	add	a, #_savedSP
      000208 F9               [12]  574 	mov	r1,a
      000209 87 81            [24]  575 	mov	_SP,@r1
      00020B D0 D0            [24]  576 	POP PSW 
      00020D D0 83            [24]  577 	POP DPH 
      00020F D0 82            [24]  578 	POP DPL 
      000211 D0 F0            [24]  579 	POP B 
      000213 D0 E0            [24]  580 	POP ACC 
                                    581 ;	preemptive.c:239: }
      000215 22               [24]  582 	ret
                                    583 ;------------------------------------------------------------
                                    584 ;Allocation info for local variables in function 'ThreadExit'
                                    585 ;------------------------------------------------------------
                                    586 ;	preemptive.c:245: void ThreadExit(void)
                                    587 ;	-----------------------------------------
                                    588 ;	 function ThreadExit
                                    589 ;	-----------------------------------------
      000216                        590 _ThreadExit:
                                    591 ;	preemptive.c:253: EA = 0;
                                    592 ;	assignBit
      000216 C2 AF            [12]  593 	clr	_EA
                                    594 ;	preemptive.c:254: temp = 1 << currentThread;
      000218 85 29 F0         [24]  595 	mov	b,_currentThread
      00021B 05 F0            [12]  596 	inc	b
      00021D 74 01            [12]  597 	mov	a,#0x01
      00021F 80 02            [24]  598 	sjmp	00136$
      000221                        599 00135$:
      000221 25 E0            [12]  600 	add	a,acc
      000223                        601 00136$:
      000223 D5 F0 FB         [24]  602 	djnz	b,00135$
      000226 F5 2E            [12]  603 	mov	_temp,a
                                    604 ;	preemptive.c:255: threadMask ^= temp;
      000228 E5 2E            [12]  605 	mov	a,_temp
      00022A 62 2A            [12]  606 	xrl	_threadMask,a
                                    607 ;	preemptive.c:256: for(i = 0; i < MAXTHREADS; i++){
      00022C 75 2B 00         [24]  608 	mov	_i,#0x00
      00022F                        609 00107$:
      00022F 74 FC            [12]  610 	mov	a,#0x100 - 0x04
      000231 25 2B            [12]  611 	add	a,_i
      000233 40 22            [24]  612 	jc	00103$
                                    613 ;	preemptive.c:257: temp = 1 << i;
      000235 85 2B F0         [24]  614 	mov	b,_i
      000238 05 F0            [12]  615 	inc	b
      00023A 74 01            [12]  616 	mov	a,#0x01
      00023C 80 02            [24]  617 	sjmp	00139$
      00023E                        618 00138$:
      00023E 25 E0            [12]  619 	add	a,acc
      000240                        620 00139$:
      000240 D5 F0 FB         [24]  621 	djnz	b,00138$
      000243 F5 2E            [12]  622 	mov	_temp,a
                                    623 ;	preemptive.c:258: if(temp & threadMask){
      000245 E5 2A            [12]  624 	mov	a,_threadMask
      000247 55 2E            [12]  625 	anl	a,_temp
      000249 60 05            [24]  626 	jz	00108$
                                    627 ;	preemptive.c:259: currentThread = i;
      00024B 85 2B 29         [24]  628 	mov	_currentThread,_i
                                    629 ;	preemptive.c:260: break;
      00024E 80 07            [24]  630 	sjmp	00103$
      000250                        631 00108$:
                                    632 ;	preemptive.c:256: for(i = 0; i < MAXTHREADS; i++){
      000250 E5 2B            [12]  633 	mov	a,_i
      000252 04               [12]  634 	inc	a
      000253 F5 2B            [12]  635 	mov	_i,a
      000255 80 D8            [24]  636 	sjmp	00107$
      000257                        637 00103$:
                                    638 ;	preemptive.c:263: if (i == MAXTHREADS){
      000257 74 04            [12]  639 	mov	a,#0x04
      000259 B5 2B 03         [24]  640 	cjne	a,_i,00105$
                                    641 ;	preemptive.c:264: currentThread = -1;
      00025C 75 29 FF         [24]  642 	mov	_currentThread,#0xff
      00025F                        643 00105$:
                                    644 ;	preemptive.c:266: RESTORESTATE;
      00025F E5 29            [12]  645 	mov	a,_currentThread
      000261 24 25            [12]  646 	add	a, #_savedSP
      000263 F9               [12]  647 	mov	r1,a
      000264 87 81            [24]  648 	mov	_SP,@r1
      000266 D0 D0            [24]  649 	POP PSW 
      000268 D0 83            [24]  650 	POP DPH 
      00026A D0 82            [24]  651 	POP DPL 
      00026C D0 F0            [24]  652 	POP B 
      00026E D0 E0            [24]  653 	POP ACC 
                                    654 ;	preemptive.c:267: EA = 1;
                                    655 ;	assignBit
      000270 D2 AF            [12]  656 	setb	_EA
                                    657 ;	preemptive.c:268: }
      000272 22               [24]  658 	ret
                                    659 	.area CSEG    (CODE)
                                    660 	.area CONST   (CODE)
                                    661 	.area XINIT   (CODE)
                                    662 	.area CABS    (ABS,CODE)
