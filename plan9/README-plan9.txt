HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Plan 9 and 9front read /dev/kbmap (kbmap(3), 9front kbdfs(8)). Lines are
table, scancode, rune. Copy plan9/haha to /sys/lib/kbmap/haha and either:

  cat /sys/lib/kbmap/haha > /dev/kbmap

or pick it in the kbmap(1) GUI. 9front also accepts kbmap=haha in plan9.ini
if the file lives in /sys/lib/kbmap/.

Physical I (0x17) is 'c' on main. AltGr is table 3. Control letters are
table 4 (physical I sends ^C because that key produces C).

Caps Lock and Left Ctrl are not scancode→rune mappings; the kernel treats
them as modifiers before kbmap. This file cannot swap them. Character
positions are the layout.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
