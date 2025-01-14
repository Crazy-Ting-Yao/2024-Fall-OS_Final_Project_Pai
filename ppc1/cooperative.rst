                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _temp
                                    110 	.globl _newThread
                                    111 	.globl _tempSP
                                    112 	.globl _i
                                    113 	.globl _threadMask
                                    114 	.globl _currentThread
                                    115 	.globl _savedSP
                                    116 	.globl _ThreadCreate
                                    117 	.globl _ThreadYield
                                    118 	.globl _ThreadExit
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
                           000030   234 _savedSP	=	0x0030
                           000034   235 _currentThread	=	0x0034
                           000035   236 _threadMask	=	0x0035
                           000036   237 _i	=	0x0036
                           000037   238 _tempSP	=	0x0037
                           000038   239 _newThread	=	0x0038
                           000039   240 _temp	=	0x0039
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable items in internal ram
                                    243 ;--------------------------------------------------------
                                    244 	.area	OSEG    (OVR,DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; indirectly addressable internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area ISEG    (DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; absolute internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area IABS    (ABS,DATA)
                                    253 	.area IABS    (ABS,DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; bit data
                                    256 ;--------------------------------------------------------
                                    257 	.area BSEG    (BIT)
                                    258 ;--------------------------------------------------------
                                    259 ; paged external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area PSEG    (PAG,XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; uninitialized external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XSEG    (XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XABS    (ABS,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; initialized external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XISEG   (XDATA)
                                    274 	.area HOME    (CODE)
                                    275 	.area GSINIT0 (CODE)
                                    276 	.area GSINIT1 (CODE)
                                    277 	.area GSINIT2 (CODE)
                                    278 	.area GSINIT3 (CODE)
                                    279 	.area GSINIT4 (CODE)
                                    280 	.area GSINIT5 (CODE)
                                    281 	.area GSINIT  (CODE)
                                    282 	.area GSFINAL (CODE)
                                    283 	.area CSEG    (CODE)
                                    284 ;--------------------------------------------------------
                                    285 ; global & static initialisations
                                    286 ;--------------------------------------------------------
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 	.area GSFINAL (CODE)
                                    290 	.area GSINIT  (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; Home
                                    293 ;--------------------------------------------------------
                                    294 	.area HOME    (CODE)
                                    295 	.area HOME    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; code
                                    298 ;--------------------------------------------------------
                                    299 	.area CSEG    (CODE)
                                    300 ;------------------------------------------------------------
                                    301 ;Allocation info for local variables in function 'Bootstrap'
                                    302 ;------------------------------------------------------------
                                    303 ;	cooperative.c:80: void Bootstrap(void){
                                    304 ;	-----------------------------------------
                                    305 ;	 function Bootstrap
                                    306 ;	-----------------------------------------
      000069                        307 _Bootstrap:
                           000007   308 	ar7 = 0x07
                           000006   309 	ar6 = 0x06
                           000005   310 	ar5 = 0x05
                           000004   311 	ar4 = 0x04
                           000003   312 	ar3 = 0x03
                           000002   313 	ar2 = 0x02
                           000001   314 	ar1 = 0x01
                           000000   315 	ar0 = 0x00
                                    316 ;	cooperative.c:93: threadMask = 0;
      000069 75 35 00         [24]  317 	mov	_threadMask,#0x00
                                    318 ;	cooperative.c:94: currentThread = ThreadCreate(main);
      00006C 90 00 56         [24]  319 	mov	dptr,#_main
      00006F 12 00 87         [24]  320 	lcall	_ThreadCreate
      000072 85 82 34         [24]  321 	mov	_currentThread,dpl
                                    322 ;	cooperative.c:95: RESTORESTATE;
      000075 E5 34            [12]  323 	mov	a,_currentThread
      000077 24 30            [12]  324 	add	a, #_savedSP
      000079 F9               [12]  325 	mov	r1,a
      00007A 87 81            [24]  326 	mov	_SP,@r1
      00007C D0 D0            [24]  327 	POP PSW 
      00007E D0 83            [24]  328 	POP DPH 
      000080 D0 82            [24]  329 	POP DPL 
      000082 D0 F0            [24]  330 	POP B 
      000084 D0 E0            [24]  331 	POP ACC 
                                    332 ;	cooperative.c:96: }
      000086 22               [24]  333 	ret
                                    334 ;------------------------------------------------------------
                                    335 ;Allocation info for local variables in function 'ThreadCreate'
                                    336 ;------------------------------------------------------------
                                    337 ;fp                        Allocated to registers 
                                    338 ;------------------------------------------------------------
                                    339 ;	cooperative.c:104: ThreadID ThreadCreate(FunctionPtr fp){
                                    340 ;	-----------------------------------------
                                    341 ;	 function ThreadCreate
                                    342 ;	-----------------------------------------
      000087                        343 _ThreadCreate:
                                    344 ;	cooperative.c:110: if(threadMask == 0x0F){
      000087 74 0F            [12]  345 	mov	a,#0x0f
      000089 B5 35 04         [24]  346 	cjne	a,_threadMask,00102$
                                    347 ;	cooperative.c:111: return -1;
      00008C 75 82 FF         [24]  348 	mov	dpl, #0xff
      00008F 22               [24]  349 	ret
      000090                        350 00102$:
                                    351 ;	cooperative.c:153: for(i = 0; i != MAXTHREADS; i++){
      000090 75 36 00         [24]  352 	mov	_i,#0x00
      000093                        353 00107$:
      000093 74 04            [12]  354 	mov	a,#0x04
      000095 B5 36 02         [24]  355 	cjne	a,_i,00137$
      000098 80 3E            [24]  356 	sjmp	00105$
      00009A                        357 00137$:
                                    358 ;	cooperative.c:156: if(!(threadMask & (1 << i))){
      00009A 85 36 F0         [24]  359 	mov	b,_i
      00009D 05 F0            [12]  360 	inc	b
      00009F 7E 01            [12]  361 	mov	r6,#0x01
      0000A1 7F 00            [12]  362 	mov	r7,#0x00
      0000A3 80 06            [24]  363 	sjmp	00139$
      0000A5                        364 00138$:
      0000A5 EE               [12]  365 	mov	a,r6
      0000A6 2E               [12]  366 	add	a,r6
      0000A7 FE               [12]  367 	mov	r6,a
      0000A8 EF               [12]  368 	mov	a,r7
      0000A9 33               [12]  369 	rlc	a
      0000AA FF               [12]  370 	mov	r7,a
      0000AB                        371 00139$:
      0000AB D5 F0 F7         [24]  372 	djnz	b,00138$
      0000AE AC 35            [24]  373 	mov	r4,_threadMask
      0000B0 7D 00            [12]  374 	mov	r5,#0x00
      0000B2 EC               [12]  375 	mov	a,r4
      0000B3 52 06            [12]  376 	anl	ar6,a
      0000B5 ED               [12]  377 	mov	a,r5
      0000B6 52 07            [12]  378 	anl	ar7,a
      0000B8 EE               [12]  379 	mov	a,r6
      0000B9 4F               [12]  380 	orl	a,r7
      0000BA 70 15            [24]  381 	jnz	00108$
                                    382 ;	cooperative.c:158: threadMask |= (1 << i);
      0000BC 85 36 F0         [24]  383 	mov	b,_i
      0000BF 05 F0            [12]  384 	inc	b
      0000C1 74 01            [12]  385 	mov	a,#0x01
      0000C3 80 02            [24]  386 	sjmp	00142$
      0000C5                        387 00141$:
      0000C5 25 E0            [12]  388 	add	a,acc
      0000C7                        389 00142$:
      0000C7 D5 F0 FB         [24]  390 	djnz	b,00141$
      0000CA 42 35            [12]  391 	orl	_threadMask,a
                                    392 ;	cooperative.c:159: newThread = i;
      0000CC 85 36 38         [24]  393 	mov	_newThread,_i
                                    394 ;	cooperative.c:160: break;
      0000CF 80 07            [24]  395 	sjmp	00105$
      0000D1                        396 00108$:
                                    397 ;	cooperative.c:153: for(i = 0; i != MAXTHREADS; i++){
      0000D1 E5 36            [12]  398 	mov	a,_i
      0000D3 04               [12]  399 	inc	a
      0000D4 F5 36            [12]  400 	mov	_i,a
      0000D6 80 BB            [24]  401 	sjmp	00107$
      0000D8                        402 00105$:
                                    403 ;	cooperative.c:164: tempSP = SP;
      0000D8 85 81 37         [24]  404 	mov	_tempSP,_SP
                                    405 ;	cooperative.c:167: SP = (0x3F) + newThread * (0x10);
      0000DB E5 38            [12]  406 	mov	a,_newThread
      0000DD C4               [12]  407 	swap	a
      0000DE 54 F0            [12]  408 	anl	a,#0xf0
      0000E0 FF               [12]  409 	mov	r7,a
      0000E1 24 3F            [12]  410 	add	a,#0x3f
      0000E3 F5 81            [12]  411 	mov	_SP,a
                                    412 ;	cooperative.c:172: __endasm;
      0000E5 C0 82            [24]  413 	PUSH	DPL
      0000E7 C0 83            [24]  414 	PUSH	DPH
                                    415 ;	cooperative.c:180: __endasm;
      0000E9 54 00            [12]  416 	ANL	A, #0
      0000EB C0 E0            [24]  417 	PUSH	ACC
      0000ED C0 E0            [24]  418 	PUSH	ACC
      0000EF C0 E0            [24]  419 	PUSH	ACC
      0000F1 C0 E0            [24]  420 	PUSH	ACC
                                    421 ;	cooperative.c:183: PSW = (newThread << 3);
      0000F3 E5 38            [12]  422 	mov	a,_newThread
      0000F5 FF               [12]  423 	mov	r7,a
      0000F6 C4               [12]  424 	swap	a
      0000F7 03               [12]  425 	rr	a
      0000F8 54 F8            [12]  426 	anl	a,#0xf8
      0000FA F5 D0            [12]  427 	mov	_PSW,a
                                    428 ;	cooperative.c:186: __endasm;
      0000FC C0 D0            [24]  429 	PUSH	PSW
                                    430 ;	cooperative.c:188: savedSP[newThread] = SP;
      0000FE E5 38            [12]  431 	mov	a,_newThread
      000100 24 30            [12]  432 	add	a, #_savedSP
      000102 F8               [12]  433 	mov	r0,a
      000103 A6 81            [24]  434 	mov	@r0,_SP
                                    435 ;	cooperative.c:190: SP = tempSP;
      000105 85 37 81         [24]  436 	mov	_SP,_tempSP
                                    437 ;	cooperative.c:192: return newThread;
      000108 85 38 82         [24]  438 	mov	dpl, _newThread
                                    439 ;	cooperative.c:193: }
      00010B 22               [24]  440 	ret
                                    441 ;------------------------------------------------------------
                                    442 ;Allocation info for local variables in function 'ThreadYield'
                                    443 ;------------------------------------------------------------
                                    444 ;	cooperative.c:202: void ThreadYield(void)
                                    445 ;	-----------------------------------------
                                    446 ;	 function ThreadYield
                                    447 ;	-----------------------------------------
      00010C                        448 _ThreadYield:
                                    449 ;	cooperative.c:204: SAVESTATE;
      00010C C0 E0            [24]  450 	PUSH ACC 
      00010E C0 F0            [24]  451 	PUSH B 
      000110 C0 82            [24]  452 	PUSH DPL 
      000112 C0 83            [24]  453 	PUSH DPH 
      000114 C0 D0            [24]  454 	PUSH PSW 
      000116 E5 34            [12]  455 	mov	a,_currentThread
      000118 24 30            [12]  456 	add	a, #_savedSP
      00011A F8               [12]  457 	mov	r0,a
      00011B A6 81            [24]  458 	mov	@r0,_SP
                                    459 ;	cooperative.c:205: do
      00011D                        460 00103$:
                                    461 ;	cooperative.c:217: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      00011D 74 FD            [12]  462 	mov	a,#0x100 - 0x03
      00011F 25 34            [12]  463 	add	a,_currentThread
      000121 40 0A            [24]  464 	jc	00108$
      000123 AF 34            [24]  465 	mov	r7,_currentThread
      000125 0F               [12]  466 	inc	r7
      000126 EF               [12]  467 	mov	a,r7
      000127 FE               [12]  468 	mov	r6,a
      000128 33               [12]  469 	rlc	a
      000129 95 E0            [12]  470 	subb	a,acc
      00012B 80 02            [24]  471 	sjmp	00109$
      00012D                        472 00108$:
      00012D 7E 00            [12]  473 	mov	r6,#0x00
      00012F                        474 00109$:
      00012F 8E 34            [24]  475 	mov	_currentThread,r6
                                    476 ;	cooperative.c:218: if (threadMask & (1 << currentThread)){
      000131 85 34 F0         [24]  477 	mov	b,_currentThread
      000134 05 F0            [12]  478 	inc	b
      000136 7E 01            [12]  479 	mov	r6,#0x01
      000138 7F 00            [12]  480 	mov	r7,#0x00
      00013A 80 06            [24]  481 	sjmp	00130$
      00013C                        482 00129$:
      00013C EE               [12]  483 	mov	a,r6
      00013D 2E               [12]  484 	add	a,r6
      00013E FE               [12]  485 	mov	r6,a
      00013F EF               [12]  486 	mov	a,r7
      000140 33               [12]  487 	rlc	a
      000141 FF               [12]  488 	mov	r7,a
      000142                        489 00130$:
      000142 D5 F0 F7         [24]  490 	djnz	b,00129$
      000145 AC 35            [24]  491 	mov	r4,_threadMask
      000147 7D 00            [12]  492 	mov	r5,#0x00
      000149 EC               [12]  493 	mov	a,r4
      00014A 52 06            [12]  494 	anl	ar6,a
      00014C ED               [12]  495 	mov	a,r5
      00014D 52 07            [12]  496 	anl	ar7,a
      00014F EE               [12]  497 	mov	a,r6
      000150 4F               [12]  498 	orl	a,r7
      000151 60 CA            [24]  499 	jz	00103$
                                    500 ;	cooperative.c:223: RESTORESTATE;
      000153 E5 34            [12]  501 	mov	a,_currentThread
      000155 24 30            [12]  502 	add	a, #_savedSP
      000157 F9               [12]  503 	mov	r1,a
      000158 87 81            [24]  504 	mov	_SP,@r1
      00015A D0 D0            [24]  505 	POP PSW 
      00015C D0 83            [24]  506 	POP DPH 
      00015E D0 82            [24]  507 	POP DPL 
      000160 D0 F0            [24]  508 	POP B 
      000162 D0 E0            [24]  509 	POP ACC 
                                    510 ;	cooperative.c:224: }
      000164 22               [24]  511 	ret
                                    512 ;------------------------------------------------------------
                                    513 ;Allocation info for local variables in function 'ThreadExit'
                                    514 ;------------------------------------------------------------
                                    515 ;	cooperative.c:231: void ThreadExit(void)
                                    516 ;	-----------------------------------------
                                    517 ;	 function ThreadExit
                                    518 ;	-----------------------------------------
      000165                        519 _ThreadExit:
                                    520 ;	cooperative.c:239: temp = 1 << currentThread;
      000165 85 34 F0         [24]  521 	mov	b,_currentThread
      000168 05 F0            [12]  522 	inc	b
      00016A 74 01            [12]  523 	mov	a,#0x01
      00016C 80 02            [24]  524 	sjmp	00136$
      00016E                        525 00135$:
      00016E 25 E0            [12]  526 	add	a,acc
      000170                        527 00136$:
      000170 D5 F0 FB         [24]  528 	djnz	b,00135$
      000173 F5 39            [12]  529 	mov	_temp,a
                                    530 ;	cooperative.c:240: threadMask ^= temp;
      000175 E5 39            [12]  531 	mov	a,_temp
      000177 62 35            [12]  532 	xrl	_threadMask,a
                                    533 ;	cooperative.c:241: for(i = 0; i < MAXTHREADS; i++){
      000179 75 36 00         [24]  534 	mov	_i,#0x00
      00017C                        535 00107$:
      00017C 74 FC            [12]  536 	mov	a,#0x100 - 0x04
      00017E 25 36            [12]  537 	add	a,_i
      000180 40 22            [24]  538 	jc	00103$
                                    539 ;	cooperative.c:242: temp = 1 << i;
      000182 85 36 F0         [24]  540 	mov	b,_i
      000185 05 F0            [12]  541 	inc	b
      000187 74 01            [12]  542 	mov	a,#0x01
      000189 80 02            [24]  543 	sjmp	00139$
      00018B                        544 00138$:
      00018B 25 E0            [12]  545 	add	a,acc
      00018D                        546 00139$:
      00018D D5 F0 FB         [24]  547 	djnz	b,00138$
      000190 F5 39            [12]  548 	mov	_temp,a
                                    549 ;	cooperative.c:243: if(temp & threadMask){
      000192 E5 35            [12]  550 	mov	a,_threadMask
      000194 55 39            [12]  551 	anl	a,_temp
      000196 60 05            [24]  552 	jz	00108$
                                    553 ;	cooperative.c:244: currentThread = i;
      000198 85 36 34         [24]  554 	mov	_currentThread,_i
                                    555 ;	cooperative.c:245: break;
      00019B 80 07            [24]  556 	sjmp	00103$
      00019D                        557 00108$:
                                    558 ;	cooperative.c:241: for(i = 0; i < MAXTHREADS; i++){
      00019D E5 36            [12]  559 	mov	a,_i
      00019F 04               [12]  560 	inc	a
      0001A0 F5 36            [12]  561 	mov	_i,a
      0001A2 80 D8            [24]  562 	sjmp	00107$
      0001A4                        563 00103$:
                                    564 ;	cooperative.c:248: if (i == MAXTHREADS){
      0001A4 74 04            [12]  565 	mov	a,#0x04
      0001A6 B5 36 03         [24]  566 	cjne	a,_i,00105$
                                    567 ;	cooperative.c:249: currentThread = -1;
      0001A9 75 34 FF         [24]  568 	mov	_currentThread,#0xff
      0001AC                        569 00105$:
                                    570 ;	cooperative.c:251: RESTORESTATE;
      0001AC E5 34            [12]  571 	mov	a,_currentThread
      0001AE 24 30            [12]  572 	add	a, #_savedSP
      0001B0 F9               [12]  573 	mov	r1,a
      0001B1 87 81            [24]  574 	mov	_SP,@r1
      0001B3 D0 D0            [24]  575 	POP PSW 
      0001B5 D0 83            [24]  576 	POP DPH 
      0001B7 D0 82            [24]  577 	POP DPL 
      0001B9 D0 F0            [24]  578 	POP B 
      0001BB D0 E0            [24]  579 	POP ACC 
                                    580 ;	cooperative.c:252: }
      0001BD 22               [24]  581 	ret
                                    582 	.area CSEG    (CODE)
                                    583 	.area CONST   (CODE)
                                    584 	.area XINIT   (CODE)
                                    585 	.area CABS    (ABS,CODE)
