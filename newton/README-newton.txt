HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

MessagePad plus Newton Keyboard use Mac-like KCHR selection (PREF 128 / KMAP / KCHR).
Classic Mac already ships KCHR/uchr in classicmac/. This tree is the documented
resource layout plus a NewtonScript stub. A loadable .pkg needs Newton Toolkit.
Do not expect a fake package here.

USB converters (TMK/QMK Newton adapters): haha-newton-kchr.txt is also the
scancode table so the keyboard can speak HackHaste into any OS.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
