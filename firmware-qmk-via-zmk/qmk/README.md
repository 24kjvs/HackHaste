# QMK

`keymaps/hackhaste/keymap.c` is logical ANSI, `LAYOUT_65_ansi`.

Physical QWERTY position → unshifted output, layer 0:

```
` 1 2 3 4 5 6 [ ] V X Z Q
  7 8 9 0 - K L C G Y W ; \
  U I A E O H R S T N P          (Caps scancode = KC_LCTL)
    ' , . / = J M D B F
```

Layer 1 is the geometric left-hand swap (`haha-left`), momentary on the key right of Right Alt. Shifted symbols are the US set of the keycode (`1!`, `7&`, `[{`, `=+`, etc.).

Board matrices differ. Transplant keycodes; do not reuse this row order on the Blackberry unless that board is `LAYOUT_65_ansi`.
