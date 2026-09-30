; HackHaste Apple II KEYIN remapper (6502)
; HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
; Assembled blob is also shipped as HAHA.BIN / HAHALEFT.BIN.
; $0300 installer (ProDOS VECTIN at $BE32), $0310 hook, $0380 table.
        .org $0300
install:
        LDA $BE32
        STA hook+1
        LDA $BE33
        STA hook+2
        LDA #<hook
        STA $BE32
        LDA #>hook
        STA $BE33
        RTS
hook:
        JSR $FD1B
        PHA
        AND #$7F
        TAY
        PLA
        AND #$80
        ORA table,Y
        RTS
        .res $0380-*
table:
        ; 128-byte identity-plus-remap table filled by the generator
