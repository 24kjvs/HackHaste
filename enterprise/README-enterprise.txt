HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

These boxes are still in banks, shops, plants, and labs. We do not fake
vendor binaries. X11 letters come from linux/xkb and linux/xmodmap.

AIX
---
X11: install linux/xkb or linux/xmodmap. Native ODM/keycomp is firmware-side.
aix-haha.imkeymap.src is SIM source if the server still sends QWERTY keysyms.
MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

HP-UX
-----
X11: same linux/xmodmap / xkb. ITE maps live in /etc/X11/XHPKeymaps
(keymap_ed / itemap) and are vendor. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

OpenVMS / VMS
-------------
haha-vms.txt is an LK/DECwindows XKB fragment. Set
DECW$DEFAULT_KEYBOARD_MAP after compiling with xkbcomp, or ask a site
specialist for SYS$KEYBOARD. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

SCO OpenServer / UnixWare
-------------------------
Still on POS/retail. X11: linux/xmodmap. Console: keys.haha with mapkey.
MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

QNX Neutrino
------------
Still in cars and industrial panels. haha-qnx.txt is a Photon/HID fold.
mkkbd compiles .kdef on a QNX box. System IME/HMI is the vendor's.
MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

Tru64 UNIX
----------
Tiny remaining base. X11: linux/xkb via xkbcomp, or xmodmap
/usr/lib/X11/keymaps. dxkeyboard will not list HackHaste until you add it.
MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

IRIX, NonStop, and MCP: same offer, no fake files.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
