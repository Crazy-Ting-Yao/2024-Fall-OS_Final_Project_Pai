                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module buttonlib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _tmp
                                    108 	.globl _AnyButtonPressed
                                    109 	.globl _ButtonToChar
                                    110 ;--------------------------------------------------------
                                    111 ; special function registers
                                    112 ;--------------------------------------------------------
                                    113 	.area RSEG    (ABS,DATA)
      000000                        114 	.org 0x0000
                           000080   115 _P0	=	0x0080
                           000081   116 _SP	=	0x0081
                           000082   117 _DPL	=	0x0082
                           000083   118 _DPH	=	0x0083
                           000087   119 _PCON	=	0x0087
                           000088   120 _TCON	=	0x0088
                           000089   121 _TMOD	=	0x0089
                           00008A   122 _TL0	=	0x008a
                           00008B   123 _TL1	=	0x008b
                           00008C   124 _TH0	=	0x008c
                           00008D   125 _TH1	=	0x008d
                           000090   126 _P1	=	0x0090
                           000098   127 _SCON	=	0x0098
                           000099   128 _SBUF	=	0x0099
                           0000A0   129 _P2	=	0x00a0
                           0000A8   130 _IE	=	0x00a8
                           0000B0   131 _P3	=	0x00b0
                           0000B8   132 _IP	=	0x00b8
                           0000D0   133 _PSW	=	0x00d0
                           0000E0   134 _ACC	=	0x00e0
                           0000F0   135 _B	=	0x00f0
                                    136 ;--------------------------------------------------------
                                    137 ; special function bits
                                    138 ;--------------------------------------------------------
                                    139 	.area RSEG    (ABS,DATA)
      000000                        140 	.org 0x0000
                           000080   141 _P0_0	=	0x0080
                           000081   142 _P0_1	=	0x0081
                           000082   143 _P0_2	=	0x0082
                           000083   144 _P0_3	=	0x0083
                           000084   145 _P0_4	=	0x0084
                           000085   146 _P0_5	=	0x0085
                           000086   147 _P0_6	=	0x0086
                           000087   148 _P0_7	=	0x0087
                           000088   149 _IT0	=	0x0088
                           000089   150 _IE0	=	0x0089
                           00008A   151 _IT1	=	0x008a
                           00008B   152 _IE1	=	0x008b
                           00008C   153 _TR0	=	0x008c
                           00008D   154 _TF0	=	0x008d
                           00008E   155 _TR1	=	0x008e
                           00008F   156 _TF1	=	0x008f
                           000090   157 _P1_0	=	0x0090
                           000091   158 _P1_1	=	0x0091
                           000092   159 _P1_2	=	0x0092
                           000093   160 _P1_3	=	0x0093
                           000094   161 _P1_4	=	0x0094
                           000095   162 _P1_5	=	0x0095
                           000096   163 _P1_6	=	0x0096
                           000097   164 _P1_7	=	0x0097
                           000098   165 _RI	=	0x0098
                           000099   166 _TI	=	0x0099
                           00009A   167 _RB8	=	0x009a
                           00009B   168 _TB8	=	0x009b
                           00009C   169 _REN	=	0x009c
                           00009D   170 _SM2	=	0x009d
                           00009E   171 _SM1	=	0x009e
                           00009F   172 _SM0	=	0x009f
                           0000A0   173 _P2_0	=	0x00a0
                           0000A1   174 _P2_1	=	0x00a1
                           0000A2   175 _P2_2	=	0x00a2
                           0000A3   176 _P2_3	=	0x00a3
                           0000A4   177 _P2_4	=	0x00a4
                           0000A5   178 _P2_5	=	0x00a5
                           0000A6   179 _P2_6	=	0x00a6
                           0000A7   180 _P2_7	=	0x00a7
                           0000A8   181 _EX0	=	0x00a8
                           0000A9   182 _ET0	=	0x00a9
                           0000AA   183 _EX1	=	0x00aa
                           0000AB   184 _ET1	=	0x00ab
                           0000AC   185 _ES	=	0x00ac
                           0000AF   186 _EA	=	0x00af
                           0000B0   187 _P3_0	=	0x00b0
                           0000B1   188 _P3_1	=	0x00b1
                           0000B2   189 _P3_2	=	0x00b2
                           0000B3   190 _P3_3	=	0x00b3
                           0000B4   191 _P3_4	=	0x00b4
                           0000B5   192 _P3_5	=	0x00b5
                           0000B6   193 _P3_6	=	0x00b6
                           0000B7   194 _P3_7	=	0x00b7
                           0000B0   195 _RXD	=	0x00b0
                           0000B1   196 _TXD	=	0x00b1
                           0000B2   197 _INT0	=	0x00b2
                           0000B3   198 _INT1	=	0x00b3
                           0000B4   199 _T0	=	0x00b4
                           0000B5   200 _T1	=	0x00b5
                           0000B6   201 _WR	=	0x00b6
                           0000B7   202 _RD	=	0x00b7
                           0000B8   203 _PX0	=	0x00b8
                           0000B9   204 _PT0	=	0x00b9
                           0000BA   205 _PX1	=	0x00ba
                           0000BB   206 _PT1	=	0x00bb
                           0000BC   207 _PS	=	0x00bc
                           0000D0   208 _P	=	0x00d0
                           0000D1   209 _F1	=	0x00d1
                           0000D2   210 _OV	=	0x00d2
                           0000D3   211 _RS0	=	0x00d3
                           0000D4   212 _RS1	=	0x00d4
                           0000D5   213 _F0	=	0x00d5
                           0000D6   214 _AC	=	0x00d6
                           0000D7   215 _CY	=	0x00d7
                                    216 ;--------------------------------------------------------
                                    217 ; overlayable register banks
                                    218 ;--------------------------------------------------------
                                    219 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        220 	.ds 8
                                    221 ;--------------------------------------------------------
                                    222 ; internal ram data
                                    223 ;--------------------------------------------------------
                                    224 	.area DSEG    (DATA)
                           00003C   225 _tmp	=	0x003c
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable items in internal ram
                                    228 ;--------------------------------------------------------
                                    229 ;--------------------------------------------------------
                                    230 ; indirectly addressable internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area ISEG    (DATA)
                                    233 ;--------------------------------------------------------
                                    234 ; absolute internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area IABS    (ABS,DATA)
                                    237 	.area IABS    (ABS,DATA)
                                    238 ;--------------------------------------------------------
                                    239 ; bit data
                                    240 ;--------------------------------------------------------
                                    241 	.area BSEG    (BIT)
      000003                        242 _AnyButtonPressed_sloc0_1_0:
      000003                        243 	.ds 1
                                    244 ;--------------------------------------------------------
                                    245 ; paged external ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area PSEG    (PAG,XDATA)
                                    248 ;--------------------------------------------------------
                                    249 ; uninitialized external ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area XSEG    (XDATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute external ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area XABS    (ABS,XDATA)
                                    256 ;--------------------------------------------------------
                                    257 ; initialized external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area XISEG   (XDATA)
                                    260 	.area HOME    (CODE)
                                    261 	.area GSINIT0 (CODE)
                                    262 	.area GSINIT1 (CODE)
                                    263 	.area GSINIT2 (CODE)
                                    264 	.area GSINIT3 (CODE)
                                    265 	.area GSINIT4 (CODE)
                                    266 	.area GSINIT5 (CODE)
                                    267 	.area GSINIT  (CODE)
                                    268 	.area GSFINAL (CODE)
                                    269 	.area CSEG    (CODE)
                                    270 ;--------------------------------------------------------
                                    271 ; global & static initialisations
                                    272 ;--------------------------------------------------------
                                    273 	.area HOME    (CODE)
                                    274 	.area GSINIT  (CODE)
                                    275 	.area GSFINAL (CODE)
                                    276 	.area GSINIT  (CODE)
                                    277 ;--------------------------------------------------------
                                    278 ; Home
                                    279 ;--------------------------------------------------------
                                    280 	.area HOME    (CODE)
                                    281 	.area HOME    (CODE)
                                    282 ;--------------------------------------------------------
                                    283 ; code
                                    284 ;--------------------------------------------------------
                                    285 	.area CSEG    (CODE)
                                    286 ;------------------------------------------------------------
                                    287 ;Allocation info for local variables in function 'AnyButtonPressed'
                                    288 ;------------------------------------------------------------
                                    289 ;	buttonlib.c:12: char AnyButtonPressed(void) {
                                    290 ;	-----------------------------------------
                                    291 ;	 function AnyButtonPressed
                                    292 ;	-----------------------------------------
      0003C7                        293 _AnyButtonPressed:
                           000007   294 	ar7 = 0x07
                           000006   295 	ar6 = 0x06
                           000005   296 	ar5 = 0x05
                           000004   297 	ar4 = 0x04
                           000003   298 	ar3 = 0x03
                           000002   299 	ar2 = 0x02
                           000001   300 	ar1 = 0x01
                           000000   301 	ar0 = 0x00
                                    302 ;	buttonlib.c:13: tmp = ~P2;
      0003C7 E5 A0            [12]  303 	mov	a,_P2
      0003C9 F4               [12]  304 	cpl	a
      0003CA F5 3C            [12]  305 	mov	_tmp,a
                                    306 ;	buttonlib.c:14: return tmp != 0;
      0003CC E5 3C            [12]  307 	mov	a,_tmp
      0003CE B4 01 00         [24]  308 	cjne	a,#0x01,00103$
      0003D1                        309 00103$:
      0003D1 B3               [12]  310 	cpl	c
      0003D2 92 03            [24]  311 	mov	_AnyButtonPressed_sloc0_1_0,c
      0003D4 E4               [12]  312 	clr	a
      0003D5 33               [12]  313 	rlc	a
      0003D6 F5 82            [12]  314 	mov	dpl,a
                                    315 ;	buttonlib.c:15: }
      0003D8 22               [24]  316 	ret
                                    317 ;------------------------------------------------------------
                                    318 ;Allocation info for local variables in function 'ButtonToChar'
                                    319 ;------------------------------------------------------------
                                    320 ;	buttonlib.c:20: char ButtonToChar(void) {
                                    321 ;	-----------------------------------------
                                    322 ;	 function ButtonToChar
                                    323 ;	-----------------------------------------
      0003D9                        324 _ButtonToChar:
                                    325 ;	buttonlib.c:21: if ((~P2) & 0x80) {
      0003D9 AE A0            [24]  326 	mov	r6,_P2
      0003DB 7F 00            [12]  327 	mov	r7,#0x00
      0003DD EE               [12]  328 	mov	a,r6
      0003DE F4               [12]  329 	cpl	a
      0003DF FE               [12]  330 	mov	r6,a
      0003E0 EF               [12]  331 	mov	a,r7
      0003E1 F4               [12]  332 	cpl	a
      0003E2 EE               [12]  333 	mov	a,r6
      0003E3 30 E7 04         [24]  334 	jnb	acc.7,00102$
                                    335 ;	buttonlib.c:22: return '7';
      0003E6 75 82 37         [24]  336 	mov	dpl, #0x37
      0003E9 22               [24]  337 	ret
      0003EA                        338 00102$:
                                    339 ;	buttonlib.c:24: if ((~P2) & 0x40) {
      0003EA AE A0            [24]  340 	mov	r6,_P2
      0003EC 7F 00            [12]  341 	mov	r7,#0x00
      0003EE EE               [12]  342 	mov	a,r6
      0003EF F4               [12]  343 	cpl	a
      0003F0 FE               [12]  344 	mov	r6,a
      0003F1 EF               [12]  345 	mov	a,r7
      0003F2 F4               [12]  346 	cpl	a
      0003F3 EE               [12]  347 	mov	a,r6
      0003F4 30 E6 04         [24]  348 	jnb	acc.6,00104$
                                    349 ;	buttonlib.c:25: return '6';
      0003F7 75 82 36         [24]  350 	mov	dpl, #0x36
      0003FA 22               [24]  351 	ret
      0003FB                        352 00104$:
                                    353 ;	buttonlib.c:27: if ((~P2) & 0x20) {
      0003FB AE A0            [24]  354 	mov	r6,_P2
      0003FD 7F 00            [12]  355 	mov	r7,#0x00
      0003FF EE               [12]  356 	mov	a,r6
      000400 F4               [12]  357 	cpl	a
      000401 FE               [12]  358 	mov	r6,a
      000402 EF               [12]  359 	mov	a,r7
      000403 F4               [12]  360 	cpl	a
      000404 EE               [12]  361 	mov	a,r6
      000405 30 E5 04         [24]  362 	jnb	acc.5,00106$
                                    363 ;	buttonlib.c:28: return '5';
      000408 75 82 35         [24]  364 	mov	dpl, #0x35
      00040B 22               [24]  365 	ret
      00040C                        366 00106$:
                                    367 ;	buttonlib.c:30: if ((~P2) & 0x10) {
      00040C AE A0            [24]  368 	mov	r6,_P2
      00040E 7F 00            [12]  369 	mov	r7,#0x00
      000410 EE               [12]  370 	mov	a,r6
      000411 F4               [12]  371 	cpl	a
      000412 FE               [12]  372 	mov	r6,a
      000413 EF               [12]  373 	mov	a,r7
      000414 F4               [12]  374 	cpl	a
      000415 EE               [12]  375 	mov	a,r6
      000416 30 E4 04         [24]  376 	jnb	acc.4,00108$
                                    377 ;	buttonlib.c:31: return '4';
      000419 75 82 34         [24]  378 	mov	dpl, #0x34
      00041C 22               [24]  379 	ret
      00041D                        380 00108$:
                                    381 ;	buttonlib.c:33: if ((~P2) & 0x08) {
      00041D AE A0            [24]  382 	mov	r6,_P2
      00041F 7F 00            [12]  383 	mov	r7,#0x00
      000421 EE               [12]  384 	mov	a,r6
      000422 F4               [12]  385 	cpl	a
      000423 FE               [12]  386 	mov	r6,a
      000424 EF               [12]  387 	mov	a,r7
      000425 F4               [12]  388 	cpl	a
      000426 EE               [12]  389 	mov	a,r6
      000427 30 E3 04         [24]  390 	jnb	acc.3,00110$
                                    391 ;	buttonlib.c:34: return '3';
      00042A 75 82 33         [24]  392 	mov	dpl, #0x33
      00042D 22               [24]  393 	ret
      00042E                        394 00110$:
                                    395 ;	buttonlib.c:36: if ((~P2) & 0x04) {
      00042E AE A0            [24]  396 	mov	r6,_P2
      000430 7F 00            [12]  397 	mov	r7,#0x00
      000432 EE               [12]  398 	mov	a,r6
      000433 F4               [12]  399 	cpl	a
      000434 FE               [12]  400 	mov	r6,a
      000435 EF               [12]  401 	mov	a,r7
      000436 F4               [12]  402 	cpl	a
      000437 EE               [12]  403 	mov	a,r6
      000438 30 E2 04         [24]  404 	jnb	acc.2,00112$
                                    405 ;	buttonlib.c:37: return '2';
      00043B 75 82 32         [24]  406 	mov	dpl, #0x32
      00043E 22               [24]  407 	ret
      00043F                        408 00112$:
                                    409 ;	buttonlib.c:39: if ((~P2) & 0x02) {
      00043F AE A0            [24]  410 	mov	r6,_P2
      000441 7F 00            [12]  411 	mov	r7,#0x00
      000443 EE               [12]  412 	mov	a,r6
      000444 F4               [12]  413 	cpl	a
      000445 FE               [12]  414 	mov	r6,a
      000446 EF               [12]  415 	mov	a,r7
      000447 F4               [12]  416 	cpl	a
      000448 EE               [12]  417 	mov	a,r6
      000449 30 E1 04         [24]  418 	jnb	acc.1,00114$
                                    419 ;	buttonlib.c:40: return '1';
      00044C 75 82 31         [24]  420 	mov	dpl, #0x31
      00044F 22               [24]  421 	ret
      000450                        422 00114$:
                                    423 ;	buttonlib.c:42: if ((~P2) & 0x01) {
      000450 AE A0            [24]  424 	mov	r6,_P2
      000452 7F 00            [12]  425 	mov	r7,#0x00
      000454 EE               [12]  426 	mov	a,r6
      000455 F4               [12]  427 	cpl	a
      000456 FE               [12]  428 	mov	r6,a
      000457 EF               [12]  429 	mov	a,r7
      000458 F4               [12]  430 	cpl	a
      000459 EE               [12]  431 	mov	a,r6
      00045A 30 E0 04         [24]  432 	jnb	acc.0,00116$
                                    433 ;	buttonlib.c:43: return '0';
      00045D 75 82 30         [24]  434 	mov	dpl, #0x30
      000460 22               [24]  435 	ret
      000461                        436 00116$:
                                    437 ;	buttonlib.c:45: return '\0';
      000461 75 82 00         [24]  438 	mov	dpl, #0x00
                                    439 ;	buttonlib.c:46: }
      000464 22               [24]  440 	ret
                                    441 	.area CSEG    (CODE)
                                    442 	.area CONST   (CODE)
                                    443 	.area XINIT   (CODE)
                                    444 	.area CABS    (ABS,CODE)
