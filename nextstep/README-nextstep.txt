HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

NeXTSTEP / OPENSTEP / early Darwin load .keymapping files (magic KYM1,
dumpkeymap(1)). Intel PC keyboards are interface ACE (2), handler 0 = 101-key,
handler 1 = 102-key ISO. Both handlers are in each file.

  Copy HackHaste.keymapping to /LocalLibrary/Keyboards/
  or ~/Library/Keyboards/ and pick it in Preferences / Keyboard.

Physical Caps (0x3A) is COMMAND; physical Left Command / GUI (0x5B) is
ALPHALOCK. Left Ctrl (0x1D) and RCtrl (0x5D) stay CONTROL. On shiftlock
variants ALPHALOCK uses the shifted character on every key, not letters
only. Physical I (0x17) is ASCII 'c' on main.

NeXT hardware ADB maps are a different interface; this package is the
Intel ACE (PC/USB) mapping. On a native NeXT board the Command key beside
space is the same swap (physical Command becomes Caps). 68k ADB dumps are
not in this package.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
