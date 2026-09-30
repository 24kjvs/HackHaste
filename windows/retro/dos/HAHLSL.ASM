; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; HackHaste Left Shift Lock DOS TSR (IBM AT and later).
; INT 9 reads port 60h, translates Set-1 make codes, writes the new code
; back through 8042 command D2h, then chains the BIOS handler.
; Caps (3Ah) becomes Ctrl (1Dh). Left Ctrl becomes Caps, except shiftlock
; variants which swallow 1Dh and stick the BIOS left-shift flag (0040:0017).
; Assemble with NASM: nasm -f bin -o HAHLSL.COM HAHLSL.ASM
; The shipped .COM is already that binary; this file is the commentary.
        bits 16
        org 100h
        jmp install
        db 'HAHA'
        db 1
; table: physical make code -> US BIOS make code
        db  000h, 001h, 02Dh, 02Fh, 02Ch, 010h, 011h, 027h, 002h, 003h, 004h, 005h, 006h, 007h, 00Eh, 00Fh
        db  019h, 022h, 02Eh, 026h, 025h, 00Ch, 008h, 009h, 00Ah, 00Bh, 01Ah, 01Bh, 01Ch, 01Dh, 031h, 014h
        db  01Fh, 013h, 023h, 018h, 012h, 01Eh, 017h, 016h, 015h, 029h, 02Ah, 02Bh, 021h, 030h, 020h, 032h
        db  024h, 00Dh, 028h, 033h, 034h, 035h, 036h, 037h, 038h, 039h, 01Dh, 03Bh, 03Ch, 03Dh, 03Eh, 03Fh
        db  040h, 041h, 042h, 043h, 044h, 045h, 046h, 047h, 048h, 049h, 04Ah, 04Bh, 04Ch, 04Dh, 04Eh, 04Fh
        db  050h, 051h, 052h, 053h, 054h, 055h, 00Ch, 057h, 058h, 059h, 05Ah, 05Bh, 05Ch, 05Dh, 05Eh, 05Fh
        db  060h, 061h, 062h, 063h, 064h, 065h, 066h, 067h, 068h, 069h, 06Ah, 06Bh, 06Ch, 06Dh, 06Eh, 06Fh
        db  070h, 071h, 072h, 073h, 074h, 075h, 076h, 077h, 078h, 079h, 07Ah, 07Bh, 07Ch, 07Dh, 07Eh, 07Fh
