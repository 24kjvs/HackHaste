; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; HackHaste DOS TSR (IBM AT and later).
; INT 9 reads port 60h, translates Set-1 make codes, writes the new code
; back through 8042 command D2h, then chains the BIOS handler.
; Caps (3Ah) becomes Ctrl (1Dh). Left Ctrl becomes Caps, except shiftlock
; variants which swallow 1Dh and stick the BIOS left-shift flag (0040:0017).
; Assemble with NASM: nasm -f bin -o HAHA.COM HAHA.ASM
; The shipped .COM is already that binary; this file is the commentary.
        bits 16
        org 100h
        jmp install
        db 'HAHA'
        db 0
; table: physical make code -> US BIOS make code
        db  000h, 001h, 002h, 003h, 004h, 005h, 006h, 007h, 01Ah, 01Bh, 02Fh, 02Dh, 02Ch, 010h, 00Eh, 00Fh
        db  008h, 009h, 00Ah, 00Bh, 00Ch, 025h, 026h, 02Eh, 022h, 015h, 011h, 027h, 01Ch, 03Ah, 016h, 017h
        db  01Eh, 012h, 018h, 023h, 013h, 01Fh, 014h, 031h, 019h, 029h, 02Ah, 02Bh, 028h, 033h, 034h, 035h
        db  00Dh, 024h, 032h, 020h, 030h, 021h, 036h, 037h, 038h, 039h, 01Dh, 03Bh, 03Ch, 03Dh, 03Eh, 03Fh
        db  040h, 041h, 042h, 043h, 044h, 045h, 046h, 047h, 048h, 049h, 04Ah, 04Bh, 04Ch, 04Dh, 04Eh, 04Fh
        db  050h, 051h, 052h, 053h, 054h, 055h, 00Ch, 057h, 058h, 059h, 05Ah, 05Bh, 05Ch, 05Dh, 05Eh, 05Fh
        db  060h, 061h, 062h, 063h, 064h, 065h, 066h, 067h, 068h, 069h, 06Ah, 06Bh, 06Ch, 06Dh, 06Eh, 06Fh
        db  070h, 071h, 072h, 073h, 074h, 075h, 076h, 077h, 078h, 079h, 07Ah, 07Bh, 07Ch, 07Dh, 07Eh, 07Fh
