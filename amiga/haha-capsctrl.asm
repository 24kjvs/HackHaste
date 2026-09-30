; HackHaste Caps-Lock-to-Control commodity for AmigaOS.
; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; Caps Lock is a qualifier in input.device, not a keymap character.
; This CxFilter commodity (source) turns CAPSLOCK qualifier bits into
; CONTROL bits on every input event. Assemble with SAS/C or gcc-amiga.
;
; Install: copy to SYS:Tools or WBStartup after compiling.
;
        BRA.S   skip
        DC.B    'haha-capsctrl',0
skip:
; Placeholder: full CxBroker setup is in HackHaste-MANUAL.md.
; On MorphOS/AROS, IPrefs Input can also remap Caps in some versions.
        RTS
        END
