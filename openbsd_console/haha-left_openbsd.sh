#!/bin/sh
# HackHaste Left layout script for OpenBSD console.
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
wsconsctl keyboard.encoding=us  \
    keyboard.map+="keycode  41 =            grave       asciitilde       dead_tilde       asciitilde " \
    keyboard.map+="keycode   2 =                x                X  dead_circumflex       asciitilde " \
    keyboard.map+="keycode   3 =                v                V               oe               OE " \
    keyboard.map+="keycode   4 =                z                Z               ae               AE " \
    keyboard.map+="keycode   5 =                q                Q       adiaeresis       Adiaeresis " \
    keyboard.map+="keycode   6 =                w                W            aring            Aring " \
    keyboard.map+="keycode   7 =        semicolon            colon       odiaeresis       Odiaeresis " \
    keyboard.map+="keycode   8 =              one           exclam       exclamdown      onesuperior " \
    keyboard.map+="keycode   9 =              two               at        masculine      twosuperior " \
    keyboard.map+="keycode  10 =            three       numbersign      ordfeminine    threesuperior " \
    keyboard.map+="keycode  11 =             four           dollar             cent         sterling " \
    keyboard.map+="keycode  12 =             five          percent             euro              yen " \
    keyboard.map+="keycode  13 =              six      asciicircum          hstroke          Hstroke " \
    keyboard.map+="keycode  16 =                p                P           oslash         Ooblique " \
    keyboard.map+="keycode  17 =                g                G      dead_ogonek       asciitilde " \
    keyboard.map+="keycode  18 =                c                C         ccedilla         Ccedilla " \
    keyboard.map+="keycode  19 =                l                L          lstroke          Lstroke " \
    keyboard.map+="keycode  20 =                k                K   dead_abovering       asciitilde " \
    keyboard.map+="keycode  21 =            minus       underscore           endash           emdash " \
    keyboard.map+="keycode  22 =            seven        ampersand              eth              ETH " \
    keyboard.map+="keycode  23 =            eight         asterisk            thorn            THORN " \
    keyboard.map+="keycode  24 =             nine        parenleft           U+2018           U+201C " \
    keyboard.map+="keycode  25 =             zero       parenright           U+2019           U+201D " \
    keyboard.map+="keycode  26 =      bracketleft        braceleft    guillemotleft       asciitilde " \
    keyboard.map+="keycode  27 =     bracketright       braceright   guillemotright       asciitilde " \
    keyboard.map+="keycode  43 =        backslash              bar       asciitilde       asciitilde " \
    keyboard.map+="keycode  30 =                n                N           ntilde           Ntilde " \
    keyboard.map+="keycode  31 =                t                T       dead_acute dead_doubleacute " \
    keyboard.map+="keycode  32 =                s                S           ssharp       asciitilde " \
    keyboard.map+="keycode  33 =                r                R       dead_grave       asciitilde " \
    keyboard.map+="keycode  34 =                h                H       dead_caron       asciitilde " \
    keyboard.map+="keycode  35 =                o                O           oacute           Oacute " \
    keyboard.map+="keycode  36 =                e                E           eacute           Eacute " \
    keyboard.map+="keycode  37 =                a                A           aacute           Aacute " \
    keyboard.map+="keycode  38 =                i                I           iacute           Iacute " \
    keyboard.map+="keycode  39 =                u                U           uacute           Uacute " \
    keyboard.map+="keycode  40 =                y                Y       udiaeresis       Udiaeresis " \
    keyboard.map+="keycode  44 =                f                F           atilde           Atilde " \
    keyboard.map+="keycode  45 =                b                B       dead_breve       asciitilde " \
    keyboard.map+="keycode  46 =                d                D   dead_diaeresis       asciitilde " \
    keyboard.map+="keycode  47 =                m                M      dead_macron       asciitilde " \
    keyboard.map+="keycode  48 =                j                J          dstroke          Dstroke " \
    keyboard.map+="keycode  49 =            equal             plus         multiply         division " \
    keyboard.map+="keycode  50 =       apostrophe         quotedbl           otilde           Otilde " \
    keyboard.map+="keycode  51 =            comma             less     dead_cedilla       asciitilde " \
    keyboard.map+="keycode  52 =           period          greater    dead_abovedot       asciitilde " \
    keyboard.map+="keycode  53 =            slash         question     questiondown       asciitilde " \
    keyboard.map+="keycode  86 =            minus       underscore           endash           emdash " \
    keyboard.map+="keycode  57 =            space            space            space     nobreakspace " \
    keyboard.map+="keycode  58 =        Control       Control          Control           Control " \
    keyboard.map+="keycode  29 =    Caps_Lock    Caps_Lock                               " \
    keyboard.map+="keycode 184 =    Mode_switch   Mode_switch                                    "
