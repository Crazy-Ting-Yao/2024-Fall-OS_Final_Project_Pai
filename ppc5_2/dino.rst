                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
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
                                     17 	.globl _game_ctrl
                                     18 	.globl _keypad_ctrl
                                     19 	.globl _render_task
                                     20 	.globl _LCD_write_char
                                     21 	.globl _LCD_IRWrite
                                     22 	.globl _LCD_Init
                                     23 	.globl _AnyKeyPressed
                                     24 	.globl _KeyToChar
                                     25 	.globl _Init_Keypad
                                     26 	.globl _ThreadReset
                                     27 	.globl _ThreadYield
                                     28 	.globl _ThreadCreate
                                     29 	.globl _CY
                                     30 	.globl _AC
                                     31 	.globl _F0
                                     32 	.globl _RS1
                                     33 	.globl _RS0
                                     34 	.globl _OV
                                     35 	.globl _F1
                                     36 	.globl _P
                                     37 	.globl _PS
                                     38 	.globl _PT1
                                     39 	.globl _PX1
                                     40 	.globl _PT0
                                     41 	.globl _PX0
                                     42 	.globl _RD
                                     43 	.globl _WR
                                     44 	.globl _T1
                                     45 	.globl _T0
                                     46 	.globl _INT1
                                     47 	.globl _INT0
                                     48 	.globl _TXD
                                     49 	.globl _RXD
                                     50 	.globl _P3_7
                                     51 	.globl _P3_6
                                     52 	.globl _P3_5
                                     53 	.globl _P3_4
                                     54 	.globl _P3_3
                                     55 	.globl _P3_2
                                     56 	.globl _P3_1
                                     57 	.globl _P3_0
                                     58 	.globl _EA
                                     59 	.globl _ES
                                     60 	.globl _ET1
                                     61 	.globl _EX1
                                     62 	.globl _ET0
                                     63 	.globl _EX0
                                     64 	.globl _P2_7
                                     65 	.globl _P2_6
                                     66 	.globl _P2_5
                                     67 	.globl _P2_4
                                     68 	.globl _P2_3
                                     69 	.globl _P2_2
                                     70 	.globl _P2_1
                                     71 	.globl _P2_0
                                     72 	.globl _SM0
                                     73 	.globl _SM1
                                     74 	.globl _SM2
                                     75 	.globl _REN
                                     76 	.globl _TB8
                                     77 	.globl _RB8
                                     78 	.globl _TI
                                     79 	.globl _RI
                                     80 	.globl _P1_7
                                     81 	.globl _P1_6
                                     82 	.globl _P1_5
                                     83 	.globl _P1_4
                                     84 	.globl _P1_3
                                     85 	.globl _P1_2
                                     86 	.globl _P1_1
                                     87 	.globl _P1_0
                                     88 	.globl _TF1
                                     89 	.globl _TR1
                                     90 	.globl _TF0
                                     91 	.globl _TR0
                                     92 	.globl _IE1
                                     93 	.globl _IT1
                                     94 	.globl _IE0
                                     95 	.globl _IT0
                                     96 	.globl _P0_7
                                     97 	.globl _P0_6
                                     98 	.globl _P0_5
                                     99 	.globl _P0_4
                                    100 	.globl _P0_3
                                    101 	.globl _P0_2
                                    102 	.globl _P0_1
                                    103 	.globl _P0_0
                                    104 	.globl _B
                                    105 	.globl _ACC
                                    106 	.globl _PSW
                                    107 	.globl _IP
                                    108 	.globl _P3
                                    109 	.globl _IE
                                    110 	.globl _P2
                                    111 	.globl _SBUF
                                    112 	.globl _SCON
                                    113 	.globl _P1
                                    114 	.globl _TH1
                                    115 	.globl _TH0
                                    116 	.globl _TL1
                                    117 	.globl _TL0
                                    118 	.globl _TMOD
                                    119 	.globl _TCON
                                    120 	.globl _PCON
                                    121 	.globl _DPH
                                    122 	.globl _DPL
                                    123 	.globl _SP
                                    124 	.globl _P0
                                    125 	.globl _temp_print
                                    126 	.globl _temp_shift
                                    127 	.globl _lose
                                    128 	.globl _points
                                    129 	.globl _dinosaur_loc
                                    130 	.globl _pop
                                    131 	.globl _currentKey
                                    132 	.globl _time
                                    133 	.globl _map_down
                                    134 	.globl _map_up
                                    135 ;--------------------------------------------------------
                                    136 ; special function registers
                                    137 ;--------------------------------------------------------
                                    138 	.area RSEG    (ABS,DATA)
      000000                        139 	.org 0x0000
                           000080   140 _P0	=	0x0080
                           000081   141 _SP	=	0x0081
                           000082   142 _DPL	=	0x0082
                           000083   143 _DPH	=	0x0083
                           000087   144 _PCON	=	0x0087
                           000088   145 _TCON	=	0x0088
                           000089   146 _TMOD	=	0x0089
                           00008A   147 _TL0	=	0x008a
                           00008B   148 _TL1	=	0x008b
                           00008C   149 _TH0	=	0x008c
                           00008D   150 _TH1	=	0x008d
                           000090   151 _P1	=	0x0090
                           000098   152 _SCON	=	0x0098
                           000099   153 _SBUF	=	0x0099
                           0000A0   154 _P2	=	0x00a0
                           0000A8   155 _IE	=	0x00a8
                           0000B0   156 _P3	=	0x00b0
                           0000B8   157 _IP	=	0x00b8
                           0000D0   158 _PSW	=	0x00d0
                           0000E0   159 _ACC	=	0x00e0
                           0000F0   160 _B	=	0x00f0
                                    161 ;--------------------------------------------------------
                                    162 ; special function bits
                                    163 ;--------------------------------------------------------
                                    164 	.area RSEG    (ABS,DATA)
      000000                        165 	.org 0x0000
                           000080   166 _P0_0	=	0x0080
                           000081   167 _P0_1	=	0x0081
                           000082   168 _P0_2	=	0x0082
                           000083   169 _P0_3	=	0x0083
                           000084   170 _P0_4	=	0x0084
                           000085   171 _P0_5	=	0x0085
                           000086   172 _P0_6	=	0x0086
                           000087   173 _P0_7	=	0x0087
                           000088   174 _IT0	=	0x0088
                           000089   175 _IE0	=	0x0089
                           00008A   176 _IT1	=	0x008a
                           00008B   177 _IE1	=	0x008b
                           00008C   178 _TR0	=	0x008c
                           00008D   179 _TF0	=	0x008d
                           00008E   180 _TR1	=	0x008e
                           00008F   181 _TF1	=	0x008f
                           000090   182 _P1_0	=	0x0090
                           000091   183 _P1_1	=	0x0091
                           000092   184 _P1_2	=	0x0092
                           000093   185 _P1_3	=	0x0093
                           000094   186 _P1_4	=	0x0094
                           000095   187 _P1_5	=	0x0095
                           000096   188 _P1_6	=	0x0096
                           000097   189 _P1_7	=	0x0097
                           000098   190 _RI	=	0x0098
                           000099   191 _TI	=	0x0099
                           00009A   192 _RB8	=	0x009a
                           00009B   193 _TB8	=	0x009b
                           00009C   194 _REN	=	0x009c
                           00009D   195 _SM2	=	0x009d
                           00009E   196 _SM1	=	0x009e
                           00009F   197 _SM0	=	0x009f
                           0000A0   198 _P2_0	=	0x00a0
                           0000A1   199 _P2_1	=	0x00a1
                           0000A2   200 _P2_2	=	0x00a2
                           0000A3   201 _P2_3	=	0x00a3
                           0000A4   202 _P2_4	=	0x00a4
                           0000A5   203 _P2_5	=	0x00a5
                           0000A6   204 _P2_6	=	0x00a6
                           0000A7   205 _P2_7	=	0x00a7
                           0000A8   206 _EX0	=	0x00a8
                           0000A9   207 _ET0	=	0x00a9
                           0000AA   208 _EX1	=	0x00aa
                           0000AB   209 _ET1	=	0x00ab
                           0000AC   210 _ES	=	0x00ac
                           0000AF   211 _EA	=	0x00af
                           0000B0   212 _P3_0	=	0x00b0
                           0000B1   213 _P3_1	=	0x00b1
                           0000B2   214 _P3_2	=	0x00b2
                           0000B3   215 _P3_3	=	0x00b3
                           0000B4   216 _P3_4	=	0x00b4
                           0000B5   217 _P3_5	=	0x00b5
                           0000B6   218 _P3_6	=	0x00b6
                           0000B7   219 _P3_7	=	0x00b7
                           0000B0   220 _RXD	=	0x00b0
                           0000B1   221 _TXD	=	0x00b1
                           0000B2   222 _INT0	=	0x00b2
                           0000B3   223 _INT1	=	0x00b3
                           0000B4   224 _T0	=	0x00b4
                           0000B5   225 _T1	=	0x00b5
                           0000B6   226 _WR	=	0x00b6
                           0000B7   227 _RD	=	0x00b7
                           0000B8   228 _PX0	=	0x00b8
                           0000B9   229 _PT0	=	0x00b9
                           0000BA   230 _PX1	=	0x00ba
                           0000BB   231 _PT1	=	0x00bb
                           0000BC   232 _PS	=	0x00bc
                           0000D0   233 _P	=	0x00d0
                           0000D1   234 _F1	=	0x00d1
                           0000D2   235 _OV	=	0x00d2
                           0000D3   236 _RS0	=	0x00d3
                           0000D4   237 _RS1	=	0x00d4
                           0000D5   238 _F0	=	0x00d5
                           0000D6   239 _AC	=	0x00d6
                           0000D7   240 _CY	=	0x00d7
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable register banks
                                    243 ;--------------------------------------------------------
                                    244 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        245 	.ds 8
                                    246 ;--------------------------------------------------------
                                    247 ; internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area DSEG    (DATA)
                           000030   250 _map_up	=	0x0030
                           000032   251 _map_down	=	0x0032
                           000034   252 _time	=	0x0034
                           000035   253 _currentKey	=	0x0035
                           000036   254 _pop	=	0x0036
                           000037   255 _dinosaur_loc	=	0x0037
                           000038   256 _points	=	0x0038
                           000039   257 _lose	=	0x0039
                           00003A   258 _temp_shift	=	0x003a
                           00003B   259 _temp_print	=	0x003b
                                    260 ;--------------------------------------------------------
                                    261 ; overlayable items in internal ram
                                    262 ;--------------------------------------------------------
                                    263 ;--------------------------------------------------------
                                    264 ; Stack segment in internal ram
                                    265 ;--------------------------------------------------------
                                    266 	.area SSEG
      000021                        267 __start__stack:
      000021                        268 	.ds	1
                                    269 
                                    270 ;--------------------------------------------------------
                                    271 ; indirectly addressable internal ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area ISEG    (DATA)
                                    274 ;--------------------------------------------------------
                                    275 ; absolute internal ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area IABS    (ABS,DATA)
                                    278 	.area IABS    (ABS,DATA)
                                    279 ;--------------------------------------------------------
                                    280 ; bit data
                                    281 ;--------------------------------------------------------
                                    282 	.area BSEG    (BIT)
      000000                        283 _keypad_ctrl_sloc0_1_0:
      000000                        284 	.ds 1
                                    285 ;--------------------------------------------------------
                                    286 ; paged external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area PSEG    (PAG,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; uninitialized external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XSEG    (XDATA)
                                    293 ;--------------------------------------------------------
                                    294 ; absolute external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area XABS    (ABS,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; initialized external ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XISEG   (XDATA)
                                    301 	.area HOME    (CODE)
                                    302 	.area GSINIT0 (CODE)
                                    303 	.area GSINIT1 (CODE)
                                    304 	.area GSINIT2 (CODE)
                                    305 	.area GSINIT3 (CODE)
                                    306 	.area GSINIT4 (CODE)
                                    307 	.area GSINIT5 (CODE)
                                    308 	.area GSINIT  (CODE)
                                    309 	.area GSFINAL (CODE)
                                    310 	.area CSEG    (CODE)
                                    311 ;--------------------------------------------------------
                                    312 ; interrupt vector
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
      000000                        315 __interrupt_vect:
      000000 02 03 5C         [24]  316 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  317 	reti
      000004                        318 	.ds	7
      00000B 02 03 63         [24]  319 	ljmp	_timer0_ISR
                                    320 ;--------------------------------------------------------
                                    321 ; global & static initialisations
                                    322 ;--------------------------------------------------------
                                    323 	.area HOME    (CODE)
                                    324 	.area GSINIT  (CODE)
                                    325 	.area GSFINAL (CODE)
                                    326 	.area GSINIT  (CODE)
                                    327 	.globl __sdcc_gsinit_startup
                                    328 	.globl __sdcc_program_startup
                                    329 	.globl __start__stack
                                    330 	.globl __mcs51_genXINIT
                                    331 	.globl __mcs51_genXRAMCLEAR
                                    332 	.globl __mcs51_genRAMCLEAR
                                    333 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  334 	ljmp	__sdcc_program_startup
                                    335 ;--------------------------------------------------------
                                    336 ; Home
                                    337 ;--------------------------------------------------------
                                    338 	.area HOME    (CODE)
                                    339 	.area HOME    (CODE)
      00000E                        340 __sdcc_program_startup:
      00000E 02 02 DA         [24]  341 	ljmp	_main
                                    342 ;	return from main will return to caller
                                    343 ;--------------------------------------------------------
                                    344 ; code
                                    345 ;--------------------------------------------------------
                                    346 	.area CSEG    (CODE)
                                    347 ;------------------------------------------------------------
                                    348 ;Allocation info for local variables in function 'render_task'
                                    349 ;------------------------------------------------------------
                                    350 ;	dino.c:33: void render_task(void){
                                    351 ;	-----------------------------------------
                                    352 ;	 function render_task
                                    353 ;	-----------------------------------------
      000014                        354 _render_task:
                           000007   355 	ar7 = 0x07
                           000006   356 	ar6 = 0x06
                           000005   357 	ar5 = 0x05
                           000004   358 	ar4 = 0x04
                           000003   359 	ar3 = 0x03
                           000002   360 	ar2 = 0x02
                           000001   361 	ar1 = 0x01
                           000000   362 	ar0 = 0x00
                                    363 ;	dino.c:34: while(1){
      000014                        364 00151$:
                                    365 ;	dino.c:35: EA = 0;
                                    366 ;	assignBit
      000014 C2 AF            [12]  367 	clr	_EA
                                    368 ;	dino.c:37: if(lose) ThreadYield();
      000016 E5 39            [12]  369 	mov	a,_lose
      000018 60 03            [24]  370 	jz	00102$
      00001A 12 04 5A         [24]  371 	lcall	_ThreadYield
      00001D                        372 00102$:
                                    373 ;	dino.c:38: if(dinosaur_loc == 0){
      00001D E5 37            [12]  374 	mov	a,_dinosaur_loc
      00001F 70 0B            [24]  375 	jnz	00106$
                                    376 ;	dino.c:39: if(map_up[0] & 0x40){
      000021 E5 30            [12]  377 	mov	a,_map_up
      000023 30 E6 06         [24]  378 	jnb	acc.6,00106$
                                    379 ;	dino.c:40: lose = 1;
      000026 75 39 01         [24]  380 	mov	_lose,#0x01
                                    381 ;	dino.c:41: ThreadYield();
      000029 12 04 5A         [24]  382 	lcall	_ThreadYield
      00002C                        383 00106$:
                                    384 ;	dino.c:44: if(dinosaur_loc == 1){
      00002C 74 01            [12]  385 	mov	a,#0x01
      00002E B5 37 0B         [24]  386 	cjne	a,_dinosaur_loc,00110$
                                    387 ;	dino.c:45: if(map_down[0] & 0x40){
      000031 E5 32            [12]  388 	mov	a,_map_down
      000033 30 E6 06         [24]  389 	jnb	acc.6,00110$
                                    390 ;	dino.c:46: lose = 1;
      000036 75 39 01         [24]  391 	mov	_lose,#0x01
                                    392 ;	dino.c:47: ThreadYield();
      000039 12 04 5A         [24]  393 	lcall	_ThreadYield
      00003C                        394 00110$:
                                    395 ;	dino.c:50: temp_shift = 0;
      00003C 75 3A 00         [24]  396 	mov	_temp_shift,#0x00
                                    397 ;	dino.c:51: if(map_up[0] & 0x80){
      00003F E5 30            [12]  398 	mov	a,_map_up
      000041 30 E7 03         [24]  399 	jnb	acc.7,00112$
                                    400 ;	dino.c:52: temp_shift = 1;
      000044 75 3A 01         [24]  401 	mov	_temp_shift,#0x01
      000047                        402 00112$:
                                    403 ;	dino.c:54: map_up[0] <<= 1;
      000047 E5 30            [12]  404 	mov	a,_map_up
      000049 25 E0            [12]  405 	add	a,acc
      00004B FF               [12]  406 	mov	r7,a
      00004C 8F 30            [24]  407 	mov	_map_up,r7
                                    408 ;	dino.c:55: if(map_up[1] & 0x80){
      00004E E5 31            [12]  409 	mov	a,(_map_up + 0x0001)
      000050 30 E7 05         [24]  410 	jnb	acc.7,00114$
                                    411 ;	dino.c:56: map_up[0]++;
      000053 E5 30            [12]  412 	mov	a,_map_up
      000055 04               [12]  413 	inc	a
      000056 F5 30            [12]  414 	mov	_map_up,a
      000058                        415 00114$:
                                    416 ;	dino.c:58: map_up[1] <<= 1;
      000058 E5 31            [12]  417 	mov	a,(_map_up + 0x0001)
      00005A 25 E0            [12]  418 	add	a,acc
      00005C FF               [12]  419 	mov	r7,a
      00005D 8F 31            [24]  420 	mov	(_map_up + 0x0001),r7
                                    421 ;	dino.c:59: if(temp_shift){
      00005F E5 3A            [12]  422 	mov	a,_temp_shift
      000061 60 0A            [24]  423 	jz	00116$
                                    424 ;	dino.c:60: points++;
      000063 E5 38            [12]  425 	mov	a,_points
      000065 04               [12]  426 	inc	a
      000066 F5 38            [12]  427 	mov	_points,a
                                    428 ;	dino.c:61: map_up[1]++;
      000068 E5 31            [12]  429 	mov	a,(_map_up + 0x0001)
      00006A 04               [12]  430 	inc	a
      00006B F5 31            [12]  431 	mov	(_map_up + 0x0001),a
      00006D                        432 00116$:
                                    433 ;	dino.c:63: temp_shift = 0;
      00006D 75 3A 00         [24]  434 	mov	_temp_shift,#0x00
                                    435 ;	dino.c:64: if(map_down[0] & 0x80){
      000070 E5 32            [12]  436 	mov	a,_map_down
      000072 30 E7 03         [24]  437 	jnb	acc.7,00118$
                                    438 ;	dino.c:65: temp_shift = 1;
      000075 75 3A 01         [24]  439 	mov	_temp_shift,#0x01
      000078                        440 00118$:
                                    441 ;	dino.c:67: map_down[0] <<= 1;
      000078 E5 32            [12]  442 	mov	a,_map_down
      00007A 25 E0            [12]  443 	add	a,acc
      00007C FF               [12]  444 	mov	r7,a
      00007D 8F 32            [24]  445 	mov	_map_down,r7
                                    446 ;	dino.c:68: if(map_down[1] & 0x80){
      00007F E5 33            [12]  447 	mov	a,(_map_down + 0x0001)
      000081 30 E7 05         [24]  448 	jnb	acc.7,00120$
                                    449 ;	dino.c:69: map_down[0]++;
      000084 E5 32            [12]  450 	mov	a,_map_down
      000086 04               [12]  451 	inc	a
      000087 F5 32            [12]  452 	mov	_map_down,a
      000089                        453 00120$:
                                    454 ;	dino.c:71: map_down[1] <<= 1;
      000089 E5 33            [12]  455 	mov	a,(_map_down + 0x0001)
      00008B 25 E0            [12]  456 	add	a,acc
      00008D FF               [12]  457 	mov	r7,a
      00008E 8F 33            [24]  458 	mov	(_map_down + 0x0001),r7
                                    459 ;	dino.c:72: if(temp_shift){
      000090 E5 3A            [12]  460 	mov	a,_temp_shift
      000092 60 0A            [24]  461 	jz	00122$
                                    462 ;	dino.c:73: points++;
      000094 E5 38            [12]  463 	mov	a,_points
      000096 04               [12]  464 	inc	a
      000097 F5 38            [12]  465 	mov	_points,a
                                    466 ;	dino.c:74: map_down[1]++;
      000099 E5 33            [12]  467 	mov	a,(_map_down + 0x0001)
      00009B 04               [12]  468 	inc	a
      00009C F5 33            [12]  469 	mov	(_map_down + 0x0001),a
      00009E                        470 00122$:
                                    471 ;	dino.c:76: LCD_cursorGoTo(0, 0);
      00009E 75 82 80         [24]  472 	mov	dpl, #0x80
      0000A1 12 05 8B         [24]  473 	lcall	_LCD_IRWrite
                                    474 ;	dino.c:77: temp_print = 0x80;
      0000A4 75 3B 80         [24]  475 	mov	_temp_print,#0x80
                                    476 ;	dino.c:78: while(temp_print){
      0000A7                        477 00126$:
      0000A7 E5 3B            [12]  478 	mov	a,_temp_print
      0000A9 60 1C            [24]  479 	jz	00128$
                                    480 ;	dino.c:79: if(map_up[0] & temp_print){
      0000AB E5 3B            [12]  481 	mov	a,_temp_print
      0000AD 55 30            [12]  482 	anl	a,_map_up
      0000AF 60 08            [24]  483 	jz	00124$
                                    484 ;	dino.c:80: LCD_write_char('\2');
      0000B1 75 82 02         [24]  485 	mov	dpl, #0x02
      0000B4 12 05 D7         [24]  486 	lcall	_LCD_write_char
      0000B7 80 06            [24]  487 	sjmp	00125$
      0000B9                        488 00124$:
                                    489 ;	dino.c:83: LCD_write_char(' ');
      0000B9 75 82 20         [24]  490 	mov	dpl, #0x20
      0000BC 12 05 D7         [24]  491 	lcall	_LCD_write_char
      0000BF                        492 00125$:
                                    493 ;	dino.c:85: temp_print >>= 1;
      0000BF E5 3B            [12]  494 	mov	a,_temp_print
      0000C1 C3               [12]  495 	clr	c
      0000C2 13               [12]  496 	rrc	a
      0000C3 F5 3B            [12]  497 	mov	_temp_print,a
      0000C5 80 E0            [24]  498 	sjmp	00126$
      0000C7                        499 00128$:
                                    500 ;	dino.c:87: temp_print = 0x80;
      0000C7 75 3B 80         [24]  501 	mov	_temp_print,#0x80
                                    502 ;	dino.c:88: while(temp_print != 1){
      0000CA                        503 00132$:
      0000CA 74 01            [12]  504 	mov	a,#0x01
      0000CC B5 3B 02         [24]  505 	cjne	a,_temp_print,00319$
      0000CF 80 1C            [24]  506 	sjmp	00134$
      0000D1                        507 00319$:
                                    508 ;	dino.c:89: if(map_up[1] & temp_print){
      0000D1 E5 3B            [12]  509 	mov	a,_temp_print
      0000D3 55 31            [12]  510 	anl	a,(_map_up + 0x0001)
      0000D5 60 08            [24]  511 	jz	00130$
                                    512 ;	dino.c:90: LCD_write_char('\2');
      0000D7 75 82 02         [24]  513 	mov	dpl, #0x02
      0000DA 12 05 D7         [24]  514 	lcall	_LCD_write_char
      0000DD 80 06            [24]  515 	sjmp	00131$
      0000DF                        516 00130$:
                                    517 ;	dino.c:93: LCD_write_char(' ');
      0000DF 75 82 20         [24]  518 	mov	dpl, #0x20
      0000E2 12 05 D7         [24]  519 	lcall	_LCD_write_char
      0000E5                        520 00131$:
                                    521 ;	dino.c:95: temp_print >>= 1;
      0000E5 E5 3B            [12]  522 	mov	a,_temp_print
      0000E7 C3               [12]  523 	clr	c
      0000E8 13               [12]  524 	rrc	a
      0000E9 F5 3B            [12]  525 	mov	_temp_print,a
      0000EB 80 DD            [24]  526 	sjmp	00132$
      0000ED                        527 00134$:
                                    528 ;	dino.c:97: LCD_cursorGoTo(1, 0);
      0000ED 75 82 C0         [24]  529 	mov	dpl, #0xc0
      0000F0 12 05 8B         [24]  530 	lcall	_LCD_IRWrite
                                    531 ;	dino.c:98: temp_print = 0x80;
      0000F3 75 3B 80         [24]  532 	mov	_temp_print,#0x80
                                    533 ;	dino.c:100: while(temp_print){
      0000F6                        534 00138$:
      0000F6 E5 3B            [12]  535 	mov	a,_temp_print
      0000F8 60 1C            [24]  536 	jz	00140$
                                    537 ;	dino.c:101: if(map_down[0] & temp_print){
      0000FA E5 3B            [12]  538 	mov	a,_temp_print
      0000FC 55 32            [12]  539 	anl	a,_map_down
      0000FE 60 08            [24]  540 	jz	00136$
                                    541 ;	dino.c:102: LCD_write_char('\2');
      000100 75 82 02         [24]  542 	mov	dpl, #0x02
      000103 12 05 D7         [24]  543 	lcall	_LCD_write_char
      000106 80 06            [24]  544 	sjmp	00137$
      000108                        545 00136$:
                                    546 ;	dino.c:105: LCD_write_char(' ');
      000108 75 82 20         [24]  547 	mov	dpl, #0x20
      00010B 12 05 D7         [24]  548 	lcall	_LCD_write_char
      00010E                        549 00137$:
                                    550 ;	dino.c:107: temp_print >>= 1;
      00010E E5 3B            [12]  551 	mov	a,_temp_print
      000110 C3               [12]  552 	clr	c
      000111 13               [12]  553 	rrc	a
      000112 F5 3B            [12]  554 	mov	_temp_print,a
      000114 80 E0            [24]  555 	sjmp	00138$
      000116                        556 00140$:
                                    557 ;	dino.c:109: temp_print = 0x80;
      000116 75 3B 80         [24]  558 	mov	_temp_print,#0x80
                                    559 ;	dino.c:110: while(temp_print != 1){
      000119                        560 00144$:
      000119 74 01            [12]  561 	mov	a,#0x01
      00011B B5 3B 02         [24]  562 	cjne	a,_temp_print,00323$
      00011E 80 1C            [24]  563 	sjmp	00146$
      000120                        564 00323$:
                                    565 ;	dino.c:111: if(map_down[1] & temp_print){
      000120 E5 3B            [12]  566 	mov	a,_temp_print
      000122 55 33            [12]  567 	anl	a,(_map_down + 0x0001)
      000124 60 08            [24]  568 	jz	00142$
                                    569 ;	dino.c:112: LCD_write_char('\2');
      000126 75 82 02         [24]  570 	mov	dpl, #0x02
      000129 12 05 D7         [24]  571 	lcall	_LCD_write_char
      00012C 80 06            [24]  572 	sjmp	00143$
      00012E                        573 00142$:
                                    574 ;	dino.c:115: LCD_write_char(' ');
      00012E 75 82 20         [24]  575 	mov	dpl, #0x20
      000131 12 05 D7         [24]  576 	lcall	_LCD_write_char
      000134                        577 00143$:
                                    578 ;	dino.c:117: temp_print >>= 1;
      000134 E5 3B            [12]  579 	mov	a,_temp_print
      000136 C3               [12]  580 	clr	c
      000137 13               [12]  581 	rrc	a
      000138 F5 3B            [12]  582 	mov	_temp_print,a
      00013A 80 DD            [24]  583 	sjmp	00144$
      00013C                        584 00146$:
                                    585 ;	dino.c:120: if(dinosaur_loc == 0){
      00013C E5 37            [12]  586 	mov	a,_dinosaur_loc
      00013E 70 0E            [24]  587 	jnz	00148$
                                    588 ;	dino.c:121: LCD_cursorGoTo(0, 0);
      000140 75 82 80         [24]  589 	mov	dpl, #0x80
      000143 12 05 8B         [24]  590 	lcall	_LCD_IRWrite
                                    591 ;	dino.c:122: LCD_write_char('\1');
      000146 75 82 01         [24]  592 	mov	dpl, #0x01
      000149 12 05 D7         [24]  593 	lcall	_LCD_write_char
      00014C 80 0C            [24]  594 	sjmp	00149$
      00014E                        595 00148$:
                                    596 ;	dino.c:125: LCD_cursorGoTo(1, 0);
      00014E 75 82 C0         [24]  597 	mov	dpl, #0xc0
      000151 12 05 8B         [24]  598 	lcall	_LCD_IRWrite
                                    599 ;	dino.c:126: LCD_write_char('\1');
      000154 75 82 01         [24]  600 	mov	dpl, #0x01
      000157 12 05 D7         [24]  601 	lcall	_LCD_write_char
      00015A                        602 00149$:
                                    603 ;	dino.c:128: EA = 1;
                                    604 ;	assignBit
      00015A D2 AF            [12]  605 	setb	_EA
                                    606 ;	dino.c:129: ThreadYield();
      00015C 12 04 5A         [24]  607 	lcall	_ThreadYield
                                    608 ;	dino.c:132: }
      00015F 02 00 14         [24]  609 	ljmp	00151$
                                    610 ;------------------------------------------------------------
                                    611 ;Allocation info for local variables in function 'keypad_ctrl'
                                    612 ;------------------------------------------------------------
                                    613 ;	dino.c:134: void keypad_ctrl(void)
                                    614 ;	-----------------------------------------
                                    615 ;	 function keypad_ctrl
                                    616 ;	-----------------------------------------
      000162                        617 _keypad_ctrl:
                                    618 ;	dino.c:143: while (!AnyKeyPressed());
      000162                        619 00101$:
      000162 12 07 51         [24]  620 	lcall	_AnyKeyPressed
      000165 E5 82            [12]  621 	mov	a, dpl
      000167 60 F9            [24]  622 	jz	00101$
                                    623 ;	dino.c:144: currentKey = KeyToChar();
      000169 12 07 5E         [24]  624 	lcall	_KeyToChar
      00016C 85 82 35         [24]  625 	mov	_currentKey,dpl
                                    626 ;	dino.c:174: }
      00016F D2 00            [12]  627 	setb	_keypad_ctrl_sloc0_1_0
      000171 10 AF 02         [24]  628 	jbc	ea,00185$
      000174 C2 00            [12]  629 	clr	_keypad_ctrl_sloc0_1_0
      000176                        630 00185$:
                                    631 ;	dino.c:146: if(currentKey == '2'){
      000176 74 32            [12]  632 	mov	a,#0x32
      000178 B5 35 2B         [24]  633 	cjne	a,_currentKey,00109$
                                    634 ;	dino.c:147: if(dinosaur_loc == 1){
      00017B 74 01            [12]  635 	mov	a,#0x01
      00017D B5 37 26         [24]  636 	cjne	a,_dinosaur_loc,00109$
                                    637 ;	dino.c:148: if(map_up[0] & 0x80){
      000180 E5 30            [12]  638 	mov	a,_map_up
      000182 30 E7 06         [24]  639 	jnb	acc.7,00105$
                                    640 ;	dino.c:149: lose = 1;
      000185 75 39 01         [24]  641 	mov	_lose,#0x01
                                    642 ;	dino.c:150: ThreadYield();
      000188 12 04 5A         [24]  643 	lcall	_ThreadYield
      00018B                        644 00105$:
                                    645 ;	dino.c:152: dinosaur_loc = 0;
      00018B 75 37 00         [24]  646 	mov	_dinosaur_loc,#0x00
                                    647 ;	dino.c:153: LCD_cursorGoTo(1, 0);
      00018E 75 82 C0         [24]  648 	mov	dpl, #0xc0
      000191 12 05 8B         [24]  649 	lcall	_LCD_IRWrite
                                    650 ;	dino.c:154: LCD_write_char(' ');
      000194 75 82 20         [24]  651 	mov	dpl, #0x20
      000197 12 05 D7         [24]  652 	lcall	_LCD_write_char
                                    653 ;	dino.c:155: LCD_cursorGoTo(0, 0);
      00019A 75 82 80         [24]  654 	mov	dpl, #0x80
      00019D 12 05 8B         [24]  655 	lcall	_LCD_IRWrite
                                    656 ;	dino.c:156: LCD_write_char('\1');
      0001A0 75 82 01         [24]  657 	mov	dpl, #0x01
      0001A3 12 05 D7         [24]  658 	lcall	_LCD_write_char
      0001A6                        659 00109$:
                                    660 ;	dino.c:160: if(currentKey == '8'){
      0001A6 74 38            [12]  661 	mov	a,#0x38
      0001A8 B5 35 2A         [24]  662 	cjne	a,_currentKey,00115$
                                    663 ;	dino.c:161: if(dinosaur_loc == 0){
      0001AB E5 37            [12]  664 	mov	a,_dinosaur_loc
      0001AD 70 26            [24]  665 	jnz	00115$
                                    666 ;	dino.c:162: if(map_down[0] & 0x80){
      0001AF E5 32            [12]  667 	mov	a,_map_down
      0001B1 30 E7 06         [24]  668 	jnb	acc.7,00111$
                                    669 ;	dino.c:163: lose = 1;
      0001B4 75 39 01         [24]  670 	mov	_lose,#0x01
                                    671 ;	dino.c:164: ThreadYield();
      0001B7 12 04 5A         [24]  672 	lcall	_ThreadYield
      0001BA                        673 00111$:
                                    674 ;	dino.c:166: dinosaur_loc = 1;
      0001BA 75 37 01         [24]  675 	mov	_dinosaur_loc,#0x01
                                    676 ;	dino.c:167: LCD_cursorGoTo(0, 0);
      0001BD 75 82 80         [24]  677 	mov	dpl, #0x80
      0001C0 12 05 8B         [24]  678 	lcall	_LCD_IRWrite
                                    679 ;	dino.c:168: LCD_write_char(' ');
      0001C3 75 82 20         [24]  680 	mov	dpl, #0x20
      0001C6 12 05 D7         [24]  681 	lcall	_LCD_write_char
                                    682 ;	dino.c:169: LCD_cursorGoTo(1, 0);
      0001C9 75 82 C0         [24]  683 	mov	dpl, #0xc0
      0001CC 12 05 8B         [24]  684 	lcall	_LCD_IRWrite
                                    685 ;	dino.c:170: LCD_write_char('\1');
      0001CF 75 82 01         [24]  686 	mov	dpl, #0x01
      0001D2 12 05 D7         [24]  687 	lcall	_LCD_write_char
      0001D5                        688 00115$:
      0001D5 A2 00            [12]  689 	mov	c,_keypad_ctrl_sloc0_1_0
      0001D7 92 AF            [24]  690 	mov	ea,c
                                    691 ;	dino.c:175: while (AnyKeyPressed());
      0001D9                        692 00116$:
      0001D9 12 07 51         [24]  693 	lcall	_AnyKeyPressed
      0001DC E5 82            [12]  694 	mov	a, dpl
      0001DE 70 F9            [24]  695 	jnz	00116$
                                    696 ;	dino.c:177: }
      0001E0 02 01 62         [24]  697 	ljmp	00101$
                                    698 ;------------------------------------------------------------
                                    699 ;Allocation info for local variables in function 'game_ctrl'
                                    700 ;------------------------------------------------------------
                                    701 ;	dino.c:184: void game_ctrl(void)
                                    702 ;	-----------------------------------------
                                    703 ;	 function game_ctrl
                                    704 ;	-----------------------------------------
      0001E3                        705 _game_ctrl:
                                    706 ;	dino.c:190: while (1){
      0001E3                        707 00104$:
                                    708 ;	dino.c:191: if(lose){
      0001E3 E5 39            [12]  709 	mov	a,_lose
      0001E5 70 03            [24]  710 	jnz	00120$
      0001E7 02 02 D4         [24]  711 	ljmp	00102$
      0001EA                        712 00120$:
                                    713 ;	dino.c:192: EA = 0;
                                    714 ;	assignBit
      0001EA C2 AF            [12]  715 	clr	_EA
                                    716 ;	dino.c:193: LCD_cursorGoTo(0, 0);
      0001EC 75 82 80         [24]  717 	mov	dpl, #0x80
      0001EF 12 05 8B         [24]  718 	lcall	_LCD_IRWrite
                                    719 ;	dino.c:194: LCD_write_char('G');
      0001F2 75 82 47         [24]  720 	mov	dpl, #0x47
      0001F5 12 05 D7         [24]  721 	lcall	_LCD_write_char
                                    722 ;	dino.c:195: LCD_write_char('A');
      0001F8 75 82 41         [24]  723 	mov	dpl, #0x41
      0001FB 12 05 D7         [24]  724 	lcall	_LCD_write_char
                                    725 ;	dino.c:196: LCD_write_char('M');
      0001FE 75 82 4D         [24]  726 	mov	dpl, #0x4d
      000201 12 05 D7         [24]  727 	lcall	_LCD_write_char
                                    728 ;	dino.c:197: LCD_write_char('E');
      000204 75 82 45         [24]  729 	mov	dpl, #0x45
      000207 12 05 D7         [24]  730 	lcall	_LCD_write_char
                                    731 ;	dino.c:198: LCD_write_char(' ');
      00020A 75 82 20         [24]  732 	mov	dpl, #0x20
      00020D 12 05 D7         [24]  733 	lcall	_LCD_write_char
                                    734 ;	dino.c:199: LCD_write_char('O');
      000210 75 82 4F         [24]  735 	mov	dpl, #0x4f
      000213 12 05 D7         [24]  736 	lcall	_LCD_write_char
                                    737 ;	dino.c:200: LCD_write_char('V');
      000216 75 82 56         [24]  738 	mov	dpl, #0x56
      000219 12 05 D7         [24]  739 	lcall	_LCD_write_char
                                    740 ;	dino.c:201: LCD_write_char('E');
      00021C 75 82 45         [24]  741 	mov	dpl, #0x45
      00021F 12 05 D7         [24]  742 	lcall	_LCD_write_char
                                    743 ;	dino.c:202: LCD_write_char('R');
      000222 75 82 52         [24]  744 	mov	dpl, #0x52
      000225 12 05 D7         [24]  745 	lcall	_LCD_write_char
                                    746 ;	dino.c:203: LCD_write_char(' ');
      000228 75 82 20         [24]  747 	mov	dpl, #0x20
      00022B 12 05 D7         [24]  748 	lcall	_LCD_write_char
                                    749 ;	dino.c:204: LCD_write_char(' ');
      00022E 75 82 20         [24]  750 	mov	dpl, #0x20
      000231 12 05 D7         [24]  751 	lcall	_LCD_write_char
                                    752 ;	dino.c:205: LCD_write_char(' ');
      000234 75 82 20         [24]  753 	mov	dpl, #0x20
      000237 12 05 D7         [24]  754 	lcall	_LCD_write_char
                                    755 ;	dino.c:206: LCD_write_char(' ');
      00023A 75 82 20         [24]  756 	mov	dpl, #0x20
      00023D 12 05 D7         [24]  757 	lcall	_LCD_write_char
                                    758 ;	dino.c:207: LCD_write_char(' ');
      000240 75 82 20         [24]  759 	mov	dpl, #0x20
      000243 12 05 D7         [24]  760 	lcall	_LCD_write_char
                                    761 ;	dino.c:208: LCD_write_char(' ');
      000246 75 82 20         [24]  762 	mov	dpl, #0x20
      000249 12 05 D7         [24]  763 	lcall	_LCD_write_char
                                    764 ;	dino.c:209: LCD_cursorGoTo(1, 0);
      00024C 75 82 C0         [24]  765 	mov	dpl, #0xc0
      00024F 12 05 8B         [24]  766 	lcall	_LCD_IRWrite
                                    767 ;	dino.c:210: LCD_write_char('S');
      000252 75 82 53         [24]  768 	mov	dpl, #0x53
      000255 12 05 D7         [24]  769 	lcall	_LCD_write_char
                                    770 ;	dino.c:211: LCD_write_char('c');
      000258 75 82 63         [24]  771 	mov	dpl, #0x63
      00025B 12 05 D7         [24]  772 	lcall	_LCD_write_char
                                    773 ;	dino.c:212: LCD_write_char('o');
      00025E 75 82 6F         [24]  774 	mov	dpl, #0x6f
      000261 12 05 D7         [24]  775 	lcall	_LCD_write_char
                                    776 ;	dino.c:213: LCD_write_char('r');
      000264 75 82 72         [24]  777 	mov	dpl, #0x72
      000267 12 05 D7         [24]  778 	lcall	_LCD_write_char
                                    779 ;	dino.c:214: LCD_write_char('e');
      00026A 75 82 65         [24]  780 	mov	dpl, #0x65
      00026D 12 05 D7         [24]  781 	lcall	_LCD_write_char
                                    782 ;	dino.c:215: LCD_write_char(' ');
      000270 75 82 20         [24]  783 	mov	dpl, #0x20
      000273 12 05 D7         [24]  784 	lcall	_LCD_write_char
                                    785 ;	dino.c:216: LCD_write_char(':');
      000276 75 82 3A         [24]  786 	mov	dpl, #0x3a
      000279 12 05 D7         [24]  787 	lcall	_LCD_write_char
                                    788 ;	dino.c:217: LCD_write_char(points/10 + '0');
      00027C AE 38            [24]  789 	mov	r6,_points
      00027E 7F 00            [12]  790 	mov	r7,#0x00
      000280 75 1B 0A         [24]  791 	mov	__divsint_PARM_2,#0x0a
      000283 8F 1C            [24]  792 	mov	(__divsint_PARM_2 + 1),r7
      000285 8E 82            [24]  793 	mov	dpl, r6
      000287 8F 83            [24]  794 	mov	dph, r7
      000289 12 08 A2         [24]  795 	lcall	__divsint
      00028C AE 82            [24]  796 	mov	r6, dpl
      00028E 74 30            [12]  797 	mov	a,#0x30
      000290 2E               [12]  798 	add	a, r6
      000291 F5 82            [12]  799 	mov	dpl,a
      000293 12 05 D7         [24]  800 	lcall	_LCD_write_char
                                    801 ;	dino.c:218: LCD_write_char(points%10 + '0');
      000296 AE 38            [24]  802 	mov	r6,_points
      000298 7F 00            [12]  803 	mov	r7,#0x00
      00029A 75 1B 0A         [24]  804 	mov	__modsint_PARM_2,#0x0a
      00029D 8F 1C            [24]  805 	mov	(__modsint_PARM_2 + 1),r7
      00029F 8E 82            [24]  806 	mov	dpl, r6
      0002A1 8F 83            [24]  807 	mov	dph, r7
      0002A3 12 08 6C         [24]  808 	lcall	__modsint
      0002A6 AE 82            [24]  809 	mov	r6, dpl
      0002A8 74 30            [12]  810 	mov	a,#0x30
      0002AA 2E               [12]  811 	add	a, r6
      0002AB F5 82            [12]  812 	mov	dpl,a
      0002AD 12 05 D7         [24]  813 	lcall	_LCD_write_char
                                    814 ;	dino.c:219: LCD_write_char(' ');
      0002B0 75 82 20         [24]  815 	mov	dpl, #0x20
      0002B3 12 05 D7         [24]  816 	lcall	_LCD_write_char
                                    817 ;	dino.c:220: LCD_write_char(' ');
      0002B6 75 82 20         [24]  818 	mov	dpl, #0x20
      0002B9 12 05 D7         [24]  819 	lcall	_LCD_write_char
                                    820 ;	dino.c:221: LCD_write_char(' ');
      0002BC 75 82 20         [24]  821 	mov	dpl, #0x20
      0002BF 12 05 D7         [24]  822 	lcall	_LCD_write_char
                                    823 ;	dino.c:222: LCD_write_char(' ');
      0002C2 75 82 20         [24]  824 	mov	dpl, #0x20
      0002C5 12 05 D7         [24]  825 	lcall	_LCD_write_char
                                    826 ;	dino.c:223: LCD_write_char(' ');
      0002C8 75 82 20         [24]  827 	mov	dpl, #0x20
      0002CB 12 05 D7         [24]  828 	lcall	_LCD_write_char
                                    829 ;	dino.c:224: LCD_write_char(' ');
      0002CE 75 82 20         [24]  830 	mov	dpl, #0x20
                                    831 ;	dino.c:225: return;
      0002D1 02 05 D7         [24]  832 	ljmp	_LCD_write_char
      0002D4                        833 00102$:
                                    834 ;	dino.c:227: ThreadYield();
      0002D4 12 04 5A         [24]  835 	lcall	_ThreadYield
                                    836 ;	dino.c:229: }
      0002D7 02 01 E3         [24]  837 	ljmp	00104$
                                    838 ;------------------------------------------------------------
                                    839 ;Allocation info for local variables in function 'main'
                                    840 ;------------------------------------------------------------
                                    841 ;	dino.c:236: void main(void)
                                    842 ;	-----------------------------------------
                                    843 ;	 function main
                                    844 ;	-----------------------------------------
      0002DA                        845 _main:
                                    846 ;	dino.c:242: Init_Keypad();
      0002DA 12 07 4B         [24]  847 	lcall	_Init_Keypad
                                    848 ;	dino.c:243: LCD_Init();
      0002DD 12 05 2A         [24]  849 	lcall	_LCD_Init
                                    850 ;	dino.c:244: LCD_entryModeSet(1, 1);
      0002E0 75 82 07         [24]  851 	mov	dpl, #0x07
      0002E3 12 05 8B         [24]  852 	lcall	_LCD_IRWrite
                                    853 ;	dino.c:245: LCD_displayOnOffControl(1, 0, 0);
      0002E6 75 82 0C         [24]  854 	mov	dpl, #0x0c
      0002E9 12 05 8B         [24]  855 	lcall	_LCD_IRWrite
                                    856 ;	dino.c:246: do{
      0002EC                        857 00117$:
                                    858 ;	dino.c:247: map_up[0] = 0x21;
      0002EC 75 30 21         [24]  859 	mov	_map_up,#0x21
                                    860 ;	dino.c:248: map_up[1] = 0xC4;
      0002EF 75 31 C4         [24]  861 	mov	(_map_up + 0x0001),#0xc4
                                    862 ;	dino.c:249: map_down[0] = 0x08;
      0002F2 75 32 08         [24]  863 	mov	_map_down,#0x08
                                    864 ;	dino.c:250: map_down[1] = 0x11;
      0002F5 75 33 11         [24]  865 	mov	(_map_down + 0x0001),#0x11
                                    866 ;	dino.c:251: EA = 0;
                                    867 ;	assignBit
      0002F8 C2 AF            [12]  868 	clr	_EA
                                    869 ;	dino.c:252: time = 0;
      0002FA 75 34 00         [24]  870 	mov	_time,#0x00
                                    871 ;	dino.c:253: lose = 0;
      0002FD 75 39 00         [24]  872 	mov	_lose,#0x00
                                    873 ;	dino.c:254: points = 0;
      000300 75 38 00         [24]  874 	mov	_points,#0x00
                                    875 ;	dino.c:255: dinosaur_loc = 0;
      000303 75 37 00         [24]  876 	mov	_dinosaur_loc,#0x00
                                    877 ;	dino.c:257: while(!AnyKeyPressed());
      000306                        878 00101$:
      000306 12 07 51         [24]  879 	lcall	_AnyKeyPressed
      000309 E5 82            [12]  880 	mov	a, dpl
      00030B 60 F9            [24]  881 	jz	00101$
                                    882 ;	dino.c:258: currentKey = KeyToChar();
      00030D 12 07 5E         [24]  883 	lcall	_KeyToChar
      000310 85 82 35         [24]  884 	mov	_currentKey,dpl
                                    885 ;	dino.c:259: while(AnyKeyPressed());
      000313                        886 00104$:
      000313 12 07 51         [24]  887 	lcall	_AnyKeyPressed
      000316 E5 82            [12]  888 	mov	a, dpl
      000318 70 F9            [24]  889 	jnz	00104$
                                    890 ;	dino.c:260: if(currentKey == '#'){
      00031A 74 23            [12]  891 	mov	a,#0x23
      00031C B5 35 06         [24]  892 	cjne	a,_currentKey,00111$
                                    893 ;	dino.c:261: if(time == 0) continue;
      00031F E5 34            [12]  894 	mov	a,_time
      000321 70 11            [24]  895 	jnz	00116$
                                    896 ;	dino.c:262: else break;
      000323 80 E1            [24]  897 	sjmp	00101$
      000325                        898 00111$:
                                    899 ;	dino.c:264: if(currentKey == '*'){
      000325 74 2A            [12]  900 	mov	a,#0x2a
      000327 B5 35 02         [24]  901 	cjne	a,_currentKey,00175$
      00032A 80 DA            [24]  902 	sjmp	00101$
      00032C                        903 00175$:
                                    904 ;	dino.c:267: time = (currentKey - '0');
      00032C E5 35            [12]  905 	mov	a,_currentKey
      00032E 24 D0            [12]  906 	add	a,#0xd0
      000330 F5 34            [12]  907 	mov	_time,a
      000332 80 D2            [24]  908 	sjmp	00101$
      000334                        909 00116$:
                                    910 ;	dino.c:276: ThreadCreate(render_task);
      000334 90 00 14         [24]  911 	mov	dptr,#_render_task
      000337 12 03 DF         [24]  912 	lcall	_ThreadCreate
                                    913 ;	dino.c:277: ThreadCreate(keypad_ctrl);
      00033A 90 01 62         [24]  914 	mov	dptr,#_keypad_ctrl
      00033D 12 03 DF         [24]  915 	lcall	_ThreadCreate
                                    916 ;	dino.c:278: TMOD = 0; // timer 0 mode 0
      000340 75 89 00         [24]  917 	mov	_TMOD,#0x00
                                    918 ;	dino.c:279: TH0 = (time << 4);
      000343 E5 34            [12]  919 	mov	a,_time
      000345 C4               [12]  920 	swap	a
      000346 54 F0            [12]  921 	anl	a,#0xf0
      000348 F5 8C            [12]  922 	mov	_TH0,a
                                    923 ;	dino.c:280: TL0 = 0x00;
      00034A 75 8A 00         [24]  924 	mov	_TL0,#0x00
                                    925 ;	dino.c:281: IE = 0x82; // enable timer 0 interrupt,
      00034D 75 A8 82         [24]  926 	mov	_IE,#0x82
                                    927 ;	dino.c:282: TR0 = 1; // start running timer0
                                    928 ;	assignBit
      000350 D2 8C            [12]  929 	setb	_TR0
                                    930 ;	dino.c:283: game_ctrl();
      000352 12 01 E3         [24]  931 	lcall	_game_ctrl
                                    932 ;	dino.c:284: EA = 0;
                                    933 ;	assignBit
      000355 C2 AF            [12]  934 	clr	_EA
                                    935 ;	dino.c:285: ThreadReset();
      000357 12 05 22         [24]  936 	lcall	_ThreadReset
                                    937 ;	dino.c:286: }while(1);
                                    938 ;	dino.c:287: }
      00035A 80 90            [24]  939 	sjmp	00117$
                                    940 ;------------------------------------------------------------
                                    941 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    942 ;------------------------------------------------------------
                                    943 ;	dino.c:289: void _sdcc_gsinit_startup(void)
                                    944 ;	-----------------------------------------
                                    945 ;	 function _sdcc_gsinit_startup
                                    946 ;	-----------------------------------------
      00035C                        947 __sdcc_gsinit_startup:
                                    948 ;	dino.c:293: __endasm;
      00035C 02 03 67         [24]  949 	LJMP	_Bootstrap
                                    950 ;	dino.c:294: }
      00035F 22               [24]  951 	ret
                                    952 ;------------------------------------------------------------
                                    953 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    954 ;------------------------------------------------------------
                                    955 ;	dino.c:296: void _mcs51_genRAMCLEAR(void) {}
                                    956 ;	-----------------------------------------
                                    957 ;	 function _mcs51_genRAMCLEAR
                                    958 ;	-----------------------------------------
      000360                        959 __mcs51_genRAMCLEAR:
      000360 22               [24]  960 	ret
                                    961 ;------------------------------------------------------------
                                    962 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    963 ;------------------------------------------------------------
                                    964 ;	dino.c:297: void _mcs51_genXINIT(void) {}
                                    965 ;	-----------------------------------------
                                    966 ;	 function _mcs51_genXINIT
                                    967 ;	-----------------------------------------
      000361                        968 __mcs51_genXINIT:
      000361 22               [24]  969 	ret
                                    970 ;------------------------------------------------------------
                                    971 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    972 ;------------------------------------------------------------
                                    973 ;	dino.c:298: void _mcs51_genXRAMCLEAR(void) {}
                                    974 ;	-----------------------------------------
                                    975 ;	 function _mcs51_genXRAMCLEAR
                                    976 ;	-----------------------------------------
      000362                        977 __mcs51_genXRAMCLEAR:
      000362 22               [24]  978 	ret
                                    979 ;------------------------------------------------------------
                                    980 ;Allocation info for local variables in function 'timer0_ISR'
                                    981 ;------------------------------------------------------------
                                    982 ;	dino.c:299: void timer0_ISR(void) __interrupt(1) {
                                    983 ;	-----------------------------------------
                                    984 ;	 function timer0_ISR
                                    985 ;	-----------------------------------------
      000363                        986 _timer0_ISR:
                                    987 ;	dino.c:302: __endasm;
      000363 02 03 85         [24]  988 	ljmp	_myTimer0Handler
                                    989 ;	dino.c:303: }
      000366 32               [24]  990 	reti
                                    991 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    992 ;	eliminated unneeded push/pop not_psw
                                    993 ;	eliminated unneeded push/pop dpl
                                    994 ;	eliminated unneeded push/pop dph
                                    995 ;	eliminated unneeded push/pop b
                                    996 ;	eliminated unneeded push/pop acc
                                    997 	.area CSEG    (CODE)
                                    998 	.area CONST   (CODE)
                                    999 	.area XINIT   (CODE)
                                   1000 	.area CABS    (ABS,CODE)
