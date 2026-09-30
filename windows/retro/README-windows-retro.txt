HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Windows Retro: DOS, Windows 95/98/Me, and 32-bit Windows NT 3.51/4.0.
Modern 64-bit Windows still uses the main windows/ zip (x86_64 DLLs).

dos\
  HAHA.COM HAHAL.COM HAHASL.COM HAHLSL.COM
  IBM AT and later (DOS 3.3 through 6.22, PC-DOS, FreeDOS, a Win9x DOS box).
  Run HAHA.COM once per boot (AUTOEXEC.BAT). It hooks INT 9, rewrites Set-1
  scancodes through the 8042, and chains BIOS. Caps becomes Ctrl. Left Ctrl
  becomes Caps Lock on HAHA/HAHAL, or a sticky Shift Lock on HAHASL/HAHLSL.
  No AltGr. XT (no 8042) is not supported.

win9x\
  kbdhaha.kbd kbdhahl.kbd kbdhhas.kbd kbdhhls.kbd and HAHA9X.REG
  Copy the .KBD files to C:\WINDOWS\SYSTEM\ (or %windir%\SYSTEM).
  Run INSTALL.BAT or REGEDIT HAHA9X.REG. Then Control Panel, Keyboard,
  Language: add HackHaste. Code page 1252; dead keys are omitted.

nti386\
  32-bit NT layout DLLs (same KBDTABLES as windows\i386) plus HAHANT4.REG.
  Windows NT 3.51 / 4.0 do not have "reg add". Copy the DLLs into
  %SystemRoot%\SYSTEM32 and REGEDIT /s HAHANT4.REG, then pick the layout
  under Regional Settings / Keyboard. Windows 2000/XP 32-bit can use this
  folder or the main windows\install-hackhaste.cmd.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
