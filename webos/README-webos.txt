HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Classic Palm/HP webOS (Pre / Pixi / Veer / TouchPad)
----------------------------------------------------
Copy kb_config-haha.json to /media/internal/virtual-keyboard/ as kb_config.json
(USB drive mode, no root). The Pre glass is 10 keys wide: this file is a fold
(vowels left, HRSTNP right, rares on orange/function), not a 15-key ANSI board.

Open webOS / LuneOS
-------------------
Paste glyphs from the JSON into the keyboard-efigs plugin
(VirtualKeyboard / InputMethod).

LG webOS TV
-----------
Apps cannot replace the system virtual keyboard.

MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
