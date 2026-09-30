; HackHaste Caps-to-Command INIT for Mac OS 7/8/9 (68000).
; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; GetKeys keymap: Caps Lock is virtual key $39 (byte 7 bit 1).
; Command is $37 (byte 6 bit 7). Control $3B is not touched.
; If the two bits differ, both are flipped (a swap).
;
; Assemble with MPW or vasm:  vasm -m68000 -Fbin haha-capscmd-init.asm
; Then paste the binary into a suitcase as resource INIT 128.
;
        BRA.S   install
oldGetKeys:
        DC.L    0
install:
        LEA     patch(PC), A0
        MOVE.L  A0, $1B0
        RTS
patch:
        MOVEA.L oldGetKeys(PC), A0
        JSR     (A0)
        MOVEQ   #0, D0
        MOVEQ   #0, D1
        BTST    #1, 7(A0)            ; Caps $39
        SNE     D0
        BTST    #7, 6(A0)            ; Command $37
        SNE     D1
        CMP.B   D0, D1
        BEQ.S   done
        BCHG    #1, 7(A0)
        BCHG    #7, 6(A0)
done:
        RTS
