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
                                    110 	.globl _my_time
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
                                    121 	.globl _ThreadReset
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000025   237 _savedSP	=	0x0025
                           000029   238 _currentThread	=	0x0029
                           00002A   239 _threadMask	=	0x002a
                           00002B   240 _i	=	0x002b
                           00002C   241 _tempSP	=	0x002c
                           00002D   242 _newThread	=	0x002d
                           00002E   243 _temp	=	0x002e
                           000034   244 _my_time	=	0x0034
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 	.area	OSEG    (OVR,DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; indirectly addressable internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area ISEG    (DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; absolute internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area IABS    (ABS,DATA)
                                    257 	.area IABS    (ABS,DATA)
                                    258 ;--------------------------------------------------------
                                    259 ; bit data
                                    260 ;--------------------------------------------------------
                                    261 	.area BSEG    (BIT)
      000001                        262 _ThreadCreate_sloc0_1_0:
      000001                        263 	.ds 1
      000002                        264 _ThreadExit_sloc0_1_0:
      000002                        265 	.ds 1
                                    266 ;--------------------------------------------------------
                                    267 ; paged external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area PSEG    (PAG,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; uninitialized external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XSEG    (XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; absolute external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XABS    (ABS,XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; initialized external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XISEG   (XDATA)
                                    282 	.area HOME    (CODE)
                                    283 	.area GSINIT0 (CODE)
                                    284 	.area GSINIT1 (CODE)
                                    285 	.area GSINIT2 (CODE)
                                    286 	.area GSINIT3 (CODE)
                                    287 	.area GSINIT4 (CODE)
                                    288 	.area GSINIT5 (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 	.area GSFINAL (CODE)
                                    291 	.area CSEG    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; global & static initialisations
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 	.area GSFINAL (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; Home
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area HOME    (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; code
                                    306 ;--------------------------------------------------------
                                    307 	.area CSEG    (CODE)
                                    308 ;------------------------------------------------------------
                                    309 ;Allocation info for local variables in function 'Bootstrap'
                                    310 ;------------------------------------------------------------
                                    311 ;	preemptive.c:81: void Bootstrap(void) {
                                    312 ;	-----------------------------------------
                                    313 ;	 function Bootstrap
                                    314 ;	-----------------------------------------
      000367                        315 _Bootstrap:
                           000007   316 	ar7 = 0x07
                           000006   317 	ar6 = 0x06
                           000005   318 	ar5 = 0x05
                           000004   319 	ar4 = 0x04
                           000003   320 	ar3 = 0x03
                           000002   321 	ar2 = 0x02
                           000001   322 	ar1 = 0x01
                           000000   323 	ar0 = 0x00
                                    324 ;	preemptive.c:82: threadMask = 0;
      000367 75 2A 00         [24]  325 	mov	_threadMask,#0x00
                                    326 ;	preemptive.c:83: currentThread = ThreadCreate(main);
      00036A 90 02 DA         [24]  327 	mov	dptr,#_main
      00036D 12 03 DF         [24]  328 	lcall	_ThreadCreate
      000370 85 82 29         [24]  329 	mov	_currentThread,dpl
                                    330 ;	preemptive.c:84: RESTORESTATE;
      000373 E5 29            [12]  331 	mov	a,_currentThread
      000375 24 25            [12]  332 	add	a, #_savedSP
      000377 F9               [12]  333 	mov	r1,a
      000378 87 81            [24]  334 	mov	_SP,@r1
      00037A D0 D0            [24]  335 	POP PSW 
      00037C D0 83            [24]  336 	POP DPH 
      00037E D0 82            [24]  337 	POP DPL 
      000380 D0 F0            [24]  338 	POP B 
      000382 D0 E0            [24]  339 	POP ACC 
                                    340 ;	preemptive.c:85: }
      000384 22               [24]  341 	ret
                                    342 ;------------------------------------------------------------
                                    343 ;Allocation info for local variables in function 'myTimer0Handler'
                                    344 ;------------------------------------------------------------
                                    345 ;	preemptive.c:93: void myTimer0Handler(void) {
                                    346 ;	-----------------------------------------
                                    347 ;	 function myTimer0Handler
                                    348 ;	-----------------------------------------
      000385                        349 _myTimer0Handler:
                                    350 ;	preemptive.c:94: EA = 0; // don't do __critial
                                    351 ;	assignBit
      000385 C2 AF            [12]  352 	clr	_EA
                                    353 ;	preemptive.c:95: SAVESTATE;
      000387 C0 E0            [24]  354 	PUSH ACC 
      000389 C0 F0            [24]  355 	PUSH B 
      00038B C0 82            [24]  356 	PUSH DPL 
      00038D C0 83            [24]  357 	PUSH DPH 
      00038F C0 D0            [24]  358 	PUSH PSW 
      000391 E5 29            [12]  359 	mov	a,_currentThread
      000393 24 25            [12]  360 	add	a, #_savedSP
      000395 F8               [12]  361 	mov	r0,a
      000396 A6 81            [24]  362 	mov	@r0,_SP
                                    363 ;	preemptive.c:115: do{
      000398                        364 00103$:
                                    365 ;	preemptive.c:116: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      000398 74 FD            [12]  366 	mov	a,#0x100 - 0x03
      00039A 25 29            [12]  367 	add	a,_currentThread
      00039C 40 0A            [24]  368 	jc	00108$
      00039E AF 29            [24]  369 	mov	r7,_currentThread
      0003A0 0F               [12]  370 	inc	r7
      0003A1 EF               [12]  371 	mov	a,r7
      0003A2 FE               [12]  372 	mov	r6,a
      0003A3 33               [12]  373 	rlc	a
      0003A4 95 E0            [12]  374 	subb	a,acc
      0003A6 80 02            [24]  375 	sjmp	00109$
      0003A8                        376 00108$:
      0003A8 7E 00            [12]  377 	mov	r6,#0x00
      0003AA                        378 00109$:
      0003AA 8E 29            [24]  379 	mov	_currentThread,r6
                                    380 ;	preemptive.c:117: temp = 1 << currentThread;
      0003AC 85 29 F0         [24]  381 	mov	b,_currentThread
      0003AF 05 F0            [12]  382 	inc	b
      0003B1 74 01            [12]  383 	mov	a,#0x01
      0003B3 80 02            [24]  384 	sjmp	00130$
      0003B5                        385 00129$:
      0003B5 25 E0            [12]  386 	add	a,acc
      0003B7                        387 00130$:
      0003B7 D5 F0 FB         [24]  388 	djnz	b,00129$
      0003BA F5 2E            [12]  389 	mov	_temp,a
                                    390 ;	preemptive.c:118: if (threadMask & temp){
      0003BC E5 2E            [12]  391 	mov	a,_temp
      0003BE 55 2A            [12]  392 	anl	a,_threadMask
      0003C0 60 D6            [24]  393 	jz	00103$
                                    394 ;	preemptive.c:140: TH0 = (my_time << 4);
      0003C2 E5 34            [12]  395 	mov	a,_my_time
      0003C4 FF               [12]  396 	mov	r7,a
      0003C5 C4               [12]  397 	swap	a
      0003C6 54 F0            [12]  398 	anl	a,#0xf0
      0003C8 F5 8C            [12]  399 	mov	_TH0,a
                                    400 ;	preemptive.c:141: EA = 1;
                                    401 ;	assignBit
      0003CA D2 AF            [12]  402 	setb	_EA
                                    403 ;	preemptive.c:142: RESTORESTATE;
      0003CC E5 29            [12]  404 	mov	a,_currentThread
      0003CE 24 25            [12]  405 	add	a, #_savedSP
      0003D0 F9               [12]  406 	mov	r1,a
      0003D1 87 81            [24]  407 	mov	_SP,@r1
      0003D3 D0 D0            [24]  408 	POP PSW 
      0003D5 D0 83            [24]  409 	POP DPH 
      0003D7 D0 82            [24]  410 	POP DPL 
      0003D9 D0 F0            [24]  411 	POP B 
      0003DB D0 E0            [24]  412 	POP ACC 
                                    413 ;	preemptive.c:148: __endasm;
      0003DD 32               [24]  414 	RETI
                                    415 ;	preemptive.c:149: }
      0003DE 22               [24]  416 	ret
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'ThreadCreate'
                                    419 ;------------------------------------------------------------
                                    420 ;fp                        Allocated to registers 
                                    421 ;------------------------------------------------------------
                                    422 ;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp){
                                    423 ;	-----------------------------------------
                                    424 ;	 function ThreadCreate
                                    425 ;	-----------------------------------------
      0003DF                        426 _ThreadCreate:
                                    427 ;	preemptive.c:157: if(threadMask == 0x0F){
      0003DF 74 0F            [12]  428 	mov	a,#0x0f
      0003E1 B5 2A 04         [24]  429 	cjne	a,_threadMask,00102$
                                    430 ;	preemptive.c:158: return -1;
      0003E4 75 82 FF         [24]  431 	mov	dpl, #0xff
      0003E7 22               [24]  432 	ret
      0003E8                        433 00102$:
                                    434 ;	preemptive.c:238: }
      0003E8 D2 01            [12]  435 	setb	_ThreadCreate_sloc0_1_0
      0003EA 10 AF 02         [24]  436 	jbc	ea,00137$
      0003ED C2 01            [12]  437 	clr	_ThreadCreate_sloc0_1_0
      0003EF                        438 00137$:
                                    439 ;	preemptive.c:200: for(i = 0; i != MAXTHREADS; i++){
      0003EF 75 2B 00         [24]  440 	mov	_i,#0x00
      0003F2                        441 00107$:
      0003F2 74 04            [12]  442 	mov	a,#0x04
      0003F4 B5 2B 02         [24]  443 	cjne	a,_i,00138$
      0003F7 80 29            [24]  444 	sjmp	00105$
      0003F9                        445 00138$:
                                    446 ;	preemptive.c:202: temp = 1;
      0003F9 75 2E 01         [24]  447 	mov	_temp,#0x01
                                    448 ;	preemptive.c:203: temp <<= i;
      0003FC 85 2B F0         [24]  449 	mov	b,_i
      0003FF 05 F0            [12]  450 	inc	b
      000401 E5 2E            [12]  451 	mov	a,_temp
      000403 80 02            [24]  452 	sjmp	00140$
      000405                        453 00139$:
      000405 25 E0            [12]  454 	add	a,acc
      000407                        455 00140$:
      000407 D5 F0 FB         [24]  456 	djnz	b,00139$
      00040A F5 2E            [12]  457 	mov	_temp,a
                                    458 ;	preemptive.c:204: if(!(threadMask & temp)){
      00040C E5 2E            [12]  459 	mov	a,_temp
      00040E 55 2A            [12]  460 	anl	a,_threadMask
      000410 70 09            [24]  461 	jnz	00108$
                                    462 ;	preemptive.c:206: threadMask |= temp;
      000412 E5 2E            [12]  463 	mov	a,_temp
      000414 42 2A            [12]  464 	orl	_threadMask,a
                                    465 ;	preemptive.c:207: newThread = i;
      000416 85 2B 2D         [24]  466 	mov	_newThread,_i
                                    467 ;	preemptive.c:208: break;
      000419 80 07            [24]  468 	sjmp	00105$
      00041B                        469 00108$:
                                    470 ;	preemptive.c:200: for(i = 0; i != MAXTHREADS; i++){
      00041B E5 2B            [12]  471 	mov	a,_i
      00041D 04               [12]  472 	inc	a
      00041E F5 2B            [12]  473 	mov	_i,a
      000420 80 D0            [24]  474 	sjmp	00107$
      000422                        475 00105$:
                                    476 ;	preemptive.c:212: tempSP = SP;
      000422 85 81 2C         [24]  477 	mov	_tempSP,_SP
                                    478 ;	preemptive.c:215: SP = (0x3F) + newThread * (0x10);
      000425 E5 2D            [12]  479 	mov	a,_newThread
      000427 C4               [12]  480 	swap	a
      000428 54 F0            [12]  481 	anl	a,#0xf0
      00042A FF               [12]  482 	mov	r7,a
      00042B 24 3F            [12]  483 	add	a,#0x3f
      00042D F5 81            [12]  484 	mov	_SP,a
                                    485 ;	preemptive.c:220: __endasm;
      00042F C0 82            [24]  486 	PUSH	DPL
      000431 C0 83            [24]  487 	PUSH	DPH
                                    488 ;	preemptive.c:228: __endasm;
      000433 54 00            [12]  489 	ANL	A, #0
      000435 C0 E0            [24]  490 	PUSH	ACC
      000437 C0 E0            [24]  491 	PUSH	ACC
      000439 C0 E0            [24]  492 	PUSH	ACC
      00043B C0 E0            [24]  493 	PUSH	ACC
                                    494 ;	preemptive.c:230: PSW = (newThread << 3);
      00043D E5 2D            [12]  495 	mov	a,_newThread
      00043F FF               [12]  496 	mov	r7,a
      000440 C4               [12]  497 	swap	a
      000441 03               [12]  498 	rr	a
      000442 54 F8            [12]  499 	anl	a,#0xf8
      000444 F5 D0            [12]  500 	mov	_PSW,a
                                    501 ;	preemptive.c:233: __endasm;
      000446 C0 D0            [24]  502 	PUSH	PSW
                                    503 ;	preemptive.c:235: savedSP[newThread] = SP;
      000448 E5 2D            [12]  504 	mov	a,_newThread
      00044A 24 25            [12]  505 	add	a, #_savedSP
      00044C F8               [12]  506 	mov	r0,a
      00044D A6 81            [24]  507 	mov	@r0,_SP
                                    508 ;	preemptive.c:237: SP = tempSP;
      00044F 85 2C 81         [24]  509 	mov	_SP,_tempSP
      000452 A2 01            [12]  510 	mov	c,_ThreadCreate_sloc0_1_0
      000454 92 AF            [24]  511 	mov	ea,c
                                    512 ;	preemptive.c:240: return newThread;
      000456 85 2D 82         [24]  513 	mov	dpl, _newThread
                                    514 ;	preemptive.c:241: }
      000459 22               [24]  515 	ret
                                    516 ;------------------------------------------------------------
                                    517 ;Allocation info for local variables in function 'ThreadYield'
                                    518 ;------------------------------------------------------------
                                    519 ;	preemptive.c:250: void ThreadYield(void){
                                    520 ;	-----------------------------------------
                                    521 ;	 function ThreadYield
                                    522 ;	-----------------------------------------
      00045A                        523 _ThreadYield:
                                    524 ;	preemptive.c:251: EA = 0;
                                    525 ;	assignBit
      00045A C2 AF            [12]  526 	clr	_EA
                                    527 ;	preemptive.c:252: SAVESTATE;
      00045C C0 E0            [24]  528 	PUSH ACC 
      00045E C0 F0            [24]  529 	PUSH B 
      000460 C0 82            [24]  530 	PUSH DPL 
      000462 C0 83            [24]  531 	PUSH DPH 
      000464 C0 D0            [24]  532 	PUSH PSW 
      000466 E5 29            [12]  533 	mov	a,_currentThread
      000468 24 25            [12]  534 	add	a, #_savedSP
      00046A F8               [12]  535 	mov	r0,a
      00046B A6 81            [24]  536 	mov	@r0,_SP
                                    537 ;	preemptive.c:271: do{
      00046D                        538 00103$:
                                    539 ;	preemptive.c:282: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      00046D 74 FD            [12]  540 	mov	a,#0x100 - 0x03
      00046F 25 29            [12]  541 	add	a,_currentThread
      000471 40 0A            [24]  542 	jc	00108$
      000473 AF 29            [24]  543 	mov	r7,_currentThread
      000475 0F               [12]  544 	inc	r7
      000476 EF               [12]  545 	mov	a,r7
      000477 FE               [12]  546 	mov	r6,a
      000478 33               [12]  547 	rlc	a
      000479 95 E0            [12]  548 	subb	a,acc
      00047B 80 02            [24]  549 	sjmp	00109$
      00047D                        550 00108$:
      00047D 7E 00            [12]  551 	mov	r6,#0x00
      00047F                        552 00109$:
      00047F 8E 29            [24]  553 	mov	_currentThread,r6
                                    554 ;	preemptive.c:283: temp = 1 << currentThread;
      000481 85 29 F0         [24]  555 	mov	b,_currentThread
      000484 05 F0            [12]  556 	inc	b
      000486 74 01            [12]  557 	mov	a,#0x01
      000488 80 02            [24]  558 	sjmp	00130$
      00048A                        559 00129$:
      00048A 25 E0            [12]  560 	add	a,acc
      00048C                        561 00130$:
      00048C D5 F0 FB         [24]  562 	djnz	b,00129$
      00048F F5 2E            [12]  563 	mov	_temp,a
                                    564 ;	preemptive.c:284: if (threadMask & temp){
      000491 E5 2E            [12]  565 	mov	a,_temp
      000493 55 2A            [12]  566 	anl	a,_threadMask
      000495 60 D6            [24]  567 	jz	00103$
                                    568 ;	preemptive.c:307: TH0 = (my_time << 4);
      000497 E5 34            [12]  569 	mov	a,_my_time
      000499 FF               [12]  570 	mov	r7,a
      00049A C4               [12]  571 	swap	a
      00049B 54 F0            [12]  572 	anl	a,#0xf0
      00049D F5 8C            [12]  573 	mov	_TH0,a
                                    574 ;	preemptive.c:308: EA = 1;
                                    575 ;	assignBit
      00049F D2 AF            [12]  576 	setb	_EA
                                    577 ;	preemptive.c:309: RESTORESTATE;
      0004A1 E5 29            [12]  578 	mov	a,_currentThread
      0004A3 24 25            [12]  579 	add	a, #_savedSP
      0004A5 F9               [12]  580 	mov	r1,a
      0004A6 87 81            [24]  581 	mov	_SP,@r1
      0004A8 D0 D0            [24]  582 	POP PSW 
      0004AA D0 83            [24]  583 	POP DPH 
      0004AC D0 82            [24]  584 	POP DPL 
      0004AE D0 F0            [24]  585 	POP B 
      0004B0 D0 E0            [24]  586 	POP ACC 
                                    587 ;	preemptive.c:310: }
      0004B2 22               [24]  588 	ret
                                    589 ;------------------------------------------------------------
                                    590 ;Allocation info for local variables in function 'ThreadExit'
                                    591 ;------------------------------------------------------------
                                    592 ;	preemptive.c:316: void ThreadExit(void)
                                    593 ;	-----------------------------------------
                                    594 ;	 function ThreadExit
                                    595 ;	-----------------------------------------
      0004B3                        596 _ThreadExit:
                                    597 ;	preemptive.c:337: }
      0004B3 D2 02            [12]  598 	setb	_ThreadExit_sloc0_1_0
      0004B5 10 AF 02         [24]  599 	jbc	ea,00135$
      0004B8 C2 02            [12]  600 	clr	_ThreadExit_sloc0_1_0
      0004BA                        601 00135$:
                                    602 ;	preemptive.c:325: threadMask ^= (1 << currentThread);
      0004BA 85 29 F0         [24]  603 	mov	b,_currentThread
      0004BD 05 F0            [12]  604 	inc	b
      0004BF 74 01            [12]  605 	mov	a,#0x01
      0004C1 80 02            [24]  606 	sjmp	00137$
      0004C3                        607 00136$:
      0004C3 25 E0            [12]  608 	add	a,acc
      0004C5                        609 00137$:
      0004C5 D5 F0 FB         [24]  610 	djnz	b,00136$
      0004C8 FF               [12]  611 	mov	r7,a
      0004C9 62 2A            [12]  612 	xrl	_threadMask,a
                                    613 ;	preemptive.c:326: for(i = 0; i < MAXTHREADS; i++){
      0004CB 75 2B 00         [24]  614 	mov	_i,#0x00
      0004CE                        615 00107$:
      0004CE 74 FC            [12]  616 	mov	a,#0x100 - 0x04
      0004D0 25 2B            [12]  617 	add	a,_i
      0004D2 40 2E            [24]  618 	jc	00103$
                                    619 ;	preemptive.c:327: if(threadMask & (1 << i)){
      0004D4 85 2B F0         [24]  620 	mov	b,_i
      0004D7 05 F0            [12]  621 	inc	b
      0004D9 7E 01            [12]  622 	mov	r6,#0x01
      0004DB 7F 00            [12]  623 	mov	r7,#0x00
      0004DD 80 06            [24]  624 	sjmp	00140$
      0004DF                        625 00139$:
      0004DF EE               [12]  626 	mov	a,r6
      0004E0 2E               [12]  627 	add	a,r6
      0004E1 FE               [12]  628 	mov	r6,a
      0004E2 EF               [12]  629 	mov	a,r7
      0004E3 33               [12]  630 	rlc	a
      0004E4 FF               [12]  631 	mov	r7,a
      0004E5                        632 00140$:
      0004E5 D5 F0 F7         [24]  633 	djnz	b,00139$
      0004E8 AC 2A            [24]  634 	mov	r4,_threadMask
      0004EA 7D 00            [12]  635 	mov	r5,#0x00
      0004EC EC               [12]  636 	mov	a,r4
      0004ED 52 06            [12]  637 	anl	ar6,a
      0004EF ED               [12]  638 	mov	a,r5
      0004F0 52 07            [12]  639 	anl	ar7,a
      0004F2 EE               [12]  640 	mov	a,r6
      0004F3 4F               [12]  641 	orl	a,r7
      0004F4 60 05            [24]  642 	jz	00108$
                                    643 ;	preemptive.c:328: currentThread = i;
      0004F6 85 2B 29         [24]  644 	mov	_currentThread,_i
                                    645 ;	preemptive.c:329: break;
      0004F9 80 07            [24]  646 	sjmp	00103$
      0004FB                        647 00108$:
                                    648 ;	preemptive.c:326: for(i = 0; i < MAXTHREADS; i++){
      0004FB E5 2B            [12]  649 	mov	a,_i
      0004FD 04               [12]  650 	inc	a
      0004FE F5 2B            [12]  651 	mov	_i,a
      000500 80 CC            [24]  652 	sjmp	00107$
      000502                        653 00103$:
                                    654 ;	preemptive.c:332: if (i == MAXTHREADS){
      000502 74 04            [12]  655 	mov	a,#0x04
      000504 B5 2B 03         [24]  656 	cjne	a,_i,00105$
                                    657 ;	preemptive.c:333: currentThread = -1;
      000507 75 29 FF         [24]  658 	mov	_currentThread,#0xff
      00050A                        659 00105$:
                                    660 ;	preemptive.c:335: RESTORESTATE;
      00050A E5 29            [12]  661 	mov	a,_currentThread
      00050C 24 25            [12]  662 	add	a, #_savedSP
      00050E F9               [12]  663 	mov	r1,a
      00050F 87 81            [24]  664 	mov	_SP,@r1
      000511 D0 D0            [24]  665 	POP PSW 
      000513 D0 83            [24]  666 	POP DPH 
      000515 D0 82            [24]  667 	POP DPL 
      000517 D0 F0            [24]  668 	POP B 
      000519 D0 E0            [24]  669 	POP ACC 
                                    670 ;	preemptive.c:336: EA = 1;
                                    671 ;	assignBit
      00051B D2 AF            [12]  672 	setb	_EA
      00051D A2 02            [12]  673 	mov	c,_ThreadExit_sloc0_1_0
      00051F 92 AF            [24]  674 	mov	ea,c
                                    675 ;	preemptive.c:338: }
      000521 22               [24]  676 	ret
                                    677 ;------------------------------------------------------------
                                    678 ;Allocation info for local variables in function 'ThreadReset'
                                    679 ;------------------------------------------------------------
                                    680 ;	preemptive.c:340: void ThreadReset(void){
                                    681 ;	-----------------------------------------
                                    682 ;	 function ThreadReset
                                    683 ;	-----------------------------------------
      000522                        684 _ThreadReset:
                                    685 ;	preemptive.c:341: threadMask = 1;
      000522 75 2A 01         [24]  686 	mov	_threadMask,#0x01
                                    687 ;	preemptive.c:342: }
      000525 22               [24]  688 	ret
                                    689 	.area CSEG    (CODE)
                                    690 	.area CONST   (CODE)
                                    691 	.area XINIT   (CODE)
                                    692 	.area CABS    (ABS,CODE)
