HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
Haiku: keymap -c < haha.keymap  then open keymap.out in Keymap preferences.
BeOS R5 (Intel): copy haha.Key_map to ~/config/settings/Key_map and reboot.
Caps Lock is Left Control in the default maps (CapsLock=0x00, LControl=0x3b).
Shift-lock maps (haha-shiftlock.keymap): physical Left Control (0x5c) is
CapsLock, and the Caps column equals Shift for every key.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
