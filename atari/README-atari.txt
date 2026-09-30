HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Atari TOS 5+ and FreeMiNT load KEYTBL.TBL when the _AKP cookie is present
(The Atari Compendium, XBIOS Keytbl). Format: big-endian magic 0x2771,
then 128-byte unshift / shift / caps tables, then three variable-length
Alternate lists (scancode, ASCII, terminated by a NUL).

  Copy HAHA.TBL to \MULTITOS\KEYTBL.TBL on the boot drive (TOS)
  or to /mint/KEYTBL.TBL (FreeMiNT), then reboot.

Only one KEYTBL.TBL is live. Pick HAHA.TBL / HAHAL.TBL / HAHASL.TBL /
HAHLSL.TBL. Physical I (IKBD 0x17, same as PC Set-1) is 'c' on main.
Caps table equals Shift on letters (or on every key for shiftlock).
IKBD Control (0x1D) and Caps (0x3A) are TOS modifiers, not table entries;
this file cannot swap them. Alternate is AltGr.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
