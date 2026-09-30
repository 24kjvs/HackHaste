; HackHaste Amiga keymap source (vasm/Devpac, 68000).
; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; Copy the generated hunk file to DEVS:Keymaps (1.x/2.0) or KEYMAPS: (2.1+).
; Then SetMap haha   or pick it in Input preferences.
; Caps Lock is an input.device qualifier; see haha-capsctrl.asm for Caps→Ctrl.

	SECTION haha,CODE

KeyMapNode:
	dc.l	0,0
	dc.b	15,0
	dc.l	Name
	dc.l	LoTypes,LoMap,LoCaps,LoRep
	dc.l	HiTypes,HiMap,HiCaps,HiRep

Name:	dc.b	'haha',0
	CNOP	0,2

LoTypes:
	dc.b	7,7,7,7,7,7,7,7
	dc.b	7,7,7,7,7,7,128,128
	dc.b	7,7,7,7,7,7,7,7
	dc.b	7,7,7,7,128,128,128,128
	dc.b	7,7,7,7,7,7,7,7
	dc.b	7,7,7,128,128,128,128,128
	dc.b	7,7,7,7,7,7,7,7
	dc.b	7,7,7,128,128,128,128,128
LoMap:
	dc.l	$607E207E
	dc.l	$3121A1B9
	dc.l	$3240BAB2
	dc.l	$3323AAB3
	dc.l	$3424A2A3
	dc.l	$35253FA5
	dc.l	$365E3F3F
	dc.l	$5B7BAB3F
	dc.l	$5D7DBB3F
	dc.l	$76563F3F
	dc.l	$7858207E
	dc.l	$7A5AE6C6
	dc.l	$7151E4C4
	dc.l	$5C7C7E7E
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$3726F0D0
	dc.l	$382AFEDE
	dc.l	$39283F3F
	dc.l	$30293F3F
	dc.l	$2D5F3F3F
	dc.l	$6B4B207E
	dc.l	$6C4C3F3F
	dc.l	$6343E7C7
	dc.l	$6747207E
	dc.l	$7959FCDC
	dc.l	$7757E5C5
	dc.l	$3B3AF6D6
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$7555FADA
	dc.l	$6949EDCD
	dc.l	$6141E1C1
	dc.l	$6545E9C9
	dc.l	$6F4FF3D3
	dc.l	$6848207E
	dc.l	$7252207E
	dc.l	$7353DF7E
	dc.l	$74542020
	dc.l	$6E4EF1D1
	dc.l	$7050F8D8
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$2D5F3F3F
	dc.l	$2722F5D5
	dc.l	$2C3C207E
	dc.l	$2E3E207E
	dc.l	$2F3FBF7E
	dc.l	$3D2BD7F7
	dc.l	$6A4A3F3F
	dc.l	$6D4D207E
	dc.l	$6444207E
	dc.l	$6242207E
	dc.l	$6646E3C3
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
LoCaps:	dc.b	0,30,224,7,255,7,192,7
LoRep:	dc.b	255,255,255,255,255,255,255,255
HiTypes:
	dc.b	7,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
	dc.b	128,128,128,128,128,128,128,128
HiMap:
	dc.l	$202020A0
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
HiCaps:	dc.b	0,0,0,0,0,0,0,0
HiRep:	dc.b	0,0,0,0,0,0,0,0
	END
