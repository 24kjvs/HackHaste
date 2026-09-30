HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Windows CE is not NT and will not load windows/i386/kbdhaha.dll as a
desktop layout. CE 5.0+ splits the map into a PS2_AT device layout
(scan → VK) and an input language (VK → Unicode). kbdgen.exe in Platform
Builder can emit those from an XP layout DLL; the .cpp files here are
that pair already filled from the canonical map.

  * Pocket PC / CE.NET with a PS/2 or HID keyboard: compile kbdhaha.cpp
    into the layout manager (exports PS2_AT_<klid> and IL_<klid>), put
    the DLL in \Windows, merge haha.reg.
  * If you already have NT kbdhaha.dll from windows/src, run
    kbdgen kbdhaha.dll  on the PB machine and keep our .reg KLIDs
    (a1b00409 and siblings) so they do not collide with kbdus.
  * HPC 2000 / CE 3.0: older kbdus.c tables; paste aScanToVKey into that
    sample. Same scancodes.

Physical I is VK_C. Caps 3A is Left Ctrl. Left Ctrl 1D is Caps Lock.
Shiftlock variants set caplok on every VKeyToWchar row.

This will not run on desktop Windows. Desktop stays windows/ and
windows/retro/.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
