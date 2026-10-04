# HackHaste Solaris Type 4 and Type 5

Console keytables for machines that never grew a Type 6 USB keyboard.
Alphanumeric keystations are the US Type 4 numbers from keytables(5).
Type 5 uses the same stations for those keys, so the two directories match.
AltGr pairings are the Type 6 set, and they follow the letter.

Caps (key 119) is Left Control. Physical Left Ctrl (key 76) is Caps Lock,
or Shift Lock on the shiftlock files. Type 6 cannot rebind Caps; these can.

## Install

`kbd -l` on Solaris 2.6 usually says type 4 for both a Type 4 and a Type 5.
Later releases grew `type_5/`. Copy to the directory `kbd` will read, and
to the flat compatibility directory 2.6 still searches.

```
cp type_4/haha /usr/share/lib/keytables/type_4/haha
cp type_4/haha /usr/share/lib/keytables/haha
loadkeys haha
```

Left: `haha-left`. Shift Lock: `haha-shiftlock`. Both: `haha-left-shiftlock`.
If a later system reports type 5, copy from `type_5/` into
`/usr/share/lib/keytables/type_5/` and load the same filename.

Do not load these on a Type 6 keyboard. The station numbers are not the Type 6 numbers.

## Still outside this package

OpenWindows and CDE do not read a console keytable. They want an `US4.kt`
entry in `/usr/openwin/share/etc/keytables/`. Compose (`fa_acute` and the
other `fa_` names) needs the stock Compose key, which these files leave
alone. An 8-bit glyph needs a locale that can show ISO-8859-1; the C locale
on 2.6 will not.
