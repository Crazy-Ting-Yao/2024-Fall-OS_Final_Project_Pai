                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module keylib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _KeyToChar
                                     12 	.globl _AnyKeyPressed
                                     13 	.globl _Init_Keypad
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
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable items in internal ram
                                    227 ;--------------------------------------------------------
                                    228 ;--------------------------------------------------------
                                    229 ; indirectly addressable internal ram data
                                    230 ;--------------------------------------------------------
                                    231 	.area ISEG    (DATA)
                                    232 ;--------------------------------------------------------
                                    233 ; absolute internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area IABS    (ABS,DATA)
                                    236 	.area IABS    (ABS,DATA)
                                    237 ;--------------------------------------------------------
                                    238 ; bit data
                                    239 ;--------------------------------------------------------
                                    240 	.area BSEG    (BIT)
      000003                        241 _AnyKeyPressed_sloc0_1_0:
      000003                        242 	.ds 1
                                    243 ;--------------------------------------------------------
                                    244 ; paged external ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area PSEG    (PAG,XDATA)
                                    247 ;--------------------------------------------------------
                                    248 ; uninitialized external ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area XSEG    (XDATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute external ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area XABS    (ABS,XDATA)
                                    255 ;--------------------------------------------------------
                                    256 ; initialized external ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area XISEG   (XDATA)
                                    259 	.area HOME    (CODE)
                                    260 	.area GSINIT0 (CODE)
                                    261 	.area GSINIT1 (CODE)
                                    262 	.area GSINIT2 (CODE)
                                    263 	.area GSINIT3 (CODE)
                                    264 	.area GSINIT4 (CODE)
                                    265 	.area GSINIT5 (CODE)
                                    266 	.area GSINIT  (CODE)
                                    267 	.area GSFINAL (CODE)
                                    268 	.area CSEG    (CODE)
                                    269 ;--------------------------------------------------------
                                    270 ; global & static initialisations
                                    271 ;--------------------------------------------------------
                                    272 	.area HOME    (CODE)
                                    273 	.area GSINIT  (CODE)
                                    274 	.area GSFINAL (CODE)
                                    275 	.area GSINIT  (CODE)
                                    276 ;--------------------------------------------------------
                                    277 ; Home
                                    278 ;--------------------------------------------------------
                                    279 	.area HOME    (CODE)
                                    280 	.area HOME    (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; code
                                    283 ;--------------------------------------------------------
                                    284 	.area CSEG    (CODE)
                                    285 ;------------------------------------------------------------
                                    286 ;Allocation info for local variables in function 'Init_Keypad'
                                    287 ;------------------------------------------------------------
                                    288 ;	keylib.c:10: void Init_Keypad(void) {
                                    289 ;	-----------------------------------------
                                    290 ;	 function Init_Keypad
                                    291 ;	-----------------------------------------
      00074B                        292 _Init_Keypad:
                           000007   293 	ar7 = 0x07
                           000006   294 	ar6 = 0x06
                           000005   295 	ar5 = 0x05
                           000004   296 	ar4 = 0x04
                           000003   297 	ar3 = 0x03
                           000002   298 	ar2 = 0x02
                           000001   299 	ar1 = 0x01
                           000000   300 	ar0 = 0x00
                                    301 ;	keylib.c:11: P3_3 = 1; // input mode from AND gate.
                                    302 ;	assignBit
      00074B D2 B3            [12]  303 	setb	_P3_3
                                    304 ;	keylib.c:13: P0 = 0xf0; // configure column 3 bits (top) as input,
      00074D 75 80 F0         [24]  305 	mov	_P0,#0xf0
                                    306 ;	keylib.c:17: }
      000750 22               [24]  307 	ret
                                    308 ;------------------------------------------------------------
                                    309 ;Allocation info for local variables in function 'AnyKeyPressed'
                                    310 ;------------------------------------------------------------
                                    311 ;	keylib.c:21: char AnyKeyPressed(void) {
                                    312 ;	-----------------------------------------
                                    313 ;	 function AnyKeyPressed
                                    314 ;	-----------------------------------------
      000751                        315 _AnyKeyPressed:
                                    316 ;	keylib.c:22: P0 = 0xf0;  // set all rows to pull-down
      000751 75 80 F0         [24]  317 	mov	_P0,#0xf0
                                    318 ;	keylib.c:23: return !P3_3; // true if any button is connected to pull-down
      000754 A2 B3            [12]  319 	mov	c,_P3_3
      000756 B3               [12]  320 	cpl	c
      000757 92 03            [24]  321 	mov  _AnyKeyPressed_sloc0_1_0,c
      000759 E4               [12]  322 	clr	a
      00075A 33               [12]  323 	rlc	a
      00075B F5 82            [12]  324 	mov	dpl,a
                                    325 ;	keylib.c:24: }
      00075D 22               [24]  326 	ret
                                    327 ;------------------------------------------------------------
                                    328 ;Allocation info for local variables in function 'KeyToChar'
                                    329 ;------------------------------------------------------------
                                    330 ;	keylib.c:30: char KeyToChar(void) {
                                    331 ;	-----------------------------------------
                                    332 ;	 function KeyToChar
                                    333 ;	-----------------------------------------
      00075E                        334 _KeyToChar:
                                    335 ;	keylib.c:31: P0 = 0xf7; // test the top row
      00075E 75 80 F7         [24]  336 	mov	_P0,#0xf7
                                    337 ;	keylib.c:32: if (P0 == 0xb7) { return '1'; }
      000761 74 B7            [12]  338 	mov	a,#0xb7
      000763 B5 80 04         [24]  339 	cjne	a,_P0,00102$
      000766 75 82 31         [24]  340 	mov	dpl, #0x31
      000769 22               [24]  341 	ret
      00076A                        342 00102$:
                                    343 ;	keylib.c:33: if (P0 == 0xd7) { return '2'; }
      00076A 74 D7            [12]  344 	mov	a,#0xd7
      00076C B5 80 04         [24]  345 	cjne	a,_P0,00104$
      00076F 75 82 32         [24]  346 	mov	dpl, #0x32
      000772 22               [24]  347 	ret
      000773                        348 00104$:
                                    349 ;	keylib.c:34: if (P0 == 0xe7) { return '3'; }
      000773 74 E7            [12]  350 	mov	a,#0xe7
      000775 B5 80 04         [24]  351 	cjne	a,_P0,00106$
      000778 75 82 33         [24]  352 	mov	dpl, #0x33
      00077B 22               [24]  353 	ret
      00077C                        354 00106$:
                                    355 ;	keylib.c:35: P0 = 0xfb; // test the next row
      00077C 75 80 FB         [24]  356 	mov	_P0,#0xfb
                                    357 ;	keylib.c:36: if (P0 == 0xbb) { return '4';}
      00077F 74 BB            [12]  358 	mov	a,#0xbb
      000781 B5 80 04         [24]  359 	cjne	a,_P0,00108$
      000784 75 82 34         [24]  360 	mov	dpl, #0x34
      000787 22               [24]  361 	ret
      000788                        362 00108$:
                                    363 ;	keylib.c:37: if (P0 == 0xdb) { return '5'; }
      000788 74 DB            [12]  364 	mov	a,#0xdb
      00078A B5 80 04         [24]  365 	cjne	a,_P0,00110$
      00078D 75 82 35         [24]  366 	mov	dpl, #0x35
      000790 22               [24]  367 	ret
      000791                        368 00110$:
                                    369 ;	keylib.c:38: if (P0 == 0xeb) { return '6'; }
      000791 74 EB            [12]  370 	mov	a,#0xeb
      000793 B5 80 04         [24]  371 	cjne	a,_P0,00112$
      000796 75 82 36         [24]  372 	mov	dpl, #0x36
      000799 22               [24]  373 	ret
      00079A                        374 00112$:
                                    375 ;	keylib.c:39: P0 = 0xfd;  // test the 3rd row
      00079A 75 80 FD         [24]  376 	mov	_P0,#0xfd
                                    377 ;	keylib.c:40: if (P0 == 0xbd) { return '7';}
      00079D 74 BD            [12]  378 	mov	a,#0xbd
      00079F B5 80 04         [24]  379 	cjne	a,_P0,00114$
      0007A2 75 82 37         [24]  380 	mov	dpl, #0x37
      0007A5 22               [24]  381 	ret
      0007A6                        382 00114$:
                                    383 ;	keylib.c:41: if (P0 == 0xdd) { return '8'; }
      0007A6 74 DD            [12]  384 	mov	a,#0xdd
      0007A8 B5 80 04         [24]  385 	cjne	a,_P0,00116$
      0007AB 75 82 38         [24]  386 	mov	dpl, #0x38
      0007AE 22               [24]  387 	ret
      0007AF                        388 00116$:
                                    389 ;	keylib.c:42: if (P0 == 0xed) { return '9'; }
      0007AF 74 ED            [12]  390 	mov	a,#0xed
      0007B1 B5 80 04         [24]  391 	cjne	a,_P0,00118$
      0007B4 75 82 39         [24]  392 	mov	dpl, #0x39
      0007B7 22               [24]  393 	ret
      0007B8                        394 00118$:
                                    395 ;	keylib.c:43: P0 = 0xfe;  // test the last row
      0007B8 75 80 FE         [24]  396 	mov	_P0,#0xfe
                                    397 ;	keylib.c:44: if (P0 == 0xbe) { return '*'; }
      0007BB 74 BE            [12]  398 	mov	a,#0xbe
      0007BD B5 80 04         [24]  399 	cjne	a,_P0,00120$
      0007C0 75 82 2A         [24]  400 	mov	dpl, #0x2a
      0007C3 22               [24]  401 	ret
      0007C4                        402 00120$:
                                    403 ;	keylib.c:45: if (P0 == 0xde) { return '0'; }
      0007C4 74 DE            [12]  404 	mov	a,#0xde
      0007C6 B5 80 04         [24]  405 	cjne	a,_P0,00122$
      0007C9 75 82 30         [24]  406 	mov	dpl, #0x30
      0007CC 22               [24]  407 	ret
      0007CD                        408 00122$:
                                    409 ;	keylib.c:46: if (P0 == 0xee) { return '#'; }
      0007CD 74 EE            [12]  410 	mov	a,#0xee
      0007CF B5 80 04         [24]  411 	cjne	a,_P0,00124$
      0007D2 75 82 23         [24]  412 	mov	dpl, #0x23
      0007D5 22               [24]  413 	ret
      0007D6                        414 00124$:
                                    415 ;	keylib.c:47: return 0;
      0007D6 75 82 00         [24]  416 	mov	dpl, #0x00
                                    417 ;	keylib.c:48: }
      0007D9 22               [24]  418 	ret
                                    419 	.area CSEG    (CODE)
                                    420 	.area CONST   (CODE)
                                    421 	.area XINIT   (CODE)
                                    422 	.area CABS    (ABS,CODE)
