HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

OS/2 Warp 3/4 and ArcaOS do not load NT DLLs or Win9x .KBD files. The
system layout lives in KEYBOARD.DCP (DEVINFO=KBD in CONFIG.SYS). Patching
that blob is a dedicated editor (Keyboard Layout Editor / KBDREF). This
package is the session-level path that does not touch DCP:

  HAHA.XLT     256-byte KbdSetCustXt table (Set-1 scancode → Latin-1)
  haha.c       Open Watcom / kLIBC loader for that table
  INSTALL.CMD  runs HAHA.EXE if you compiled it

Physical I (0x17) becomes 'c' on main. Digits 7-0 sit on the letter row.
Caps↔Ctrl is not expressible in the XLT; set it in the Keyboard object
when the product offers a swap, or keep Caps as Caps.

Compile (ArcaOS / OS/2 with Open Watcom):

  wcc386 -bt=os2 haha.c
  wlink sys os2v2 name HAHA.EXE file haha.obj

Then HAHA.EXE once per session, or from STARTUP.CMD.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
