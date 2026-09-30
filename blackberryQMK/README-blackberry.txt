HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

BBOS 7 (Java): haha-bbos7-fold.txt is the 30/32/39-key hardware matrix fold.
HahaKeyListener.java is an in-app sample. System-wide remap is firmware;
we do not ship a fake radio-signed COD.

BB10: Settings, Input and Languages (and External Keyboard). No app can
intercept keys globally.

BBQ10 hardware used on other computers: use QMK, not this tree.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
