HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

ReactOS and Wine load the same NT KbdLayerDescriptor DLLs as Windows 2000-11.
There is no extra tree. Use windows/src/*.c (compile) or windows/i386 and
windows/x86_64 if mingw already built them.

ReactOS
-------
Copy kbdhaha.dll (and the left / shiftlock siblings you want) into
%SystemRoot%\system32. Import the same registry values install-hackhaste.cmd
writes under HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b00409
(Layout File, Layout Text, Layout Id). ReactOS 0.4+ understands those keys.
Add the layout in the Keyboard control panel. Caps scancode 0x3A is VK_LCONTROL;
Left Ctrl 0x1D is VK_CAPITAL.

Wine / Proton
-------------
wine cmd /c install-hackhaste.cmd   from the windows/ folder, after the DLLs
exist in windows/i386 or windows/x86_64, OR copy a DLL into
drive_c/windows/system32 and run wine regedit on a .reg that matches the
install script. Then: wine control international  (or LANG= with
LoadKeyboardLayout). Prefix-specific: each Wine prefix needs its own copy.

Win9x / DOS ReactOS does not emulate. Those stay in windows/retro/.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
