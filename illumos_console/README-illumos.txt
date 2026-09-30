HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

illumos and OpenIndiana use the same Type 6 USB keytables as Solaris
(keytables(5), loadkeys(1)). Files here are that format.

  kbd -l                         # type=6 for USB
  pfexec cp type_6/haha /usr/share/lib/keytables/type_6/haha
  pfexec cp type_6/layout_190 /usr/share/lib/keytables/type_6/layout_190
  pfexec sh -c 'cat type_6/kbd_layouts.haha >> /usr/share/lib/keytables/type_6/kbd_layouts'
  pfexec loadkeys /usr/share/lib/keytables/type_6/haha

kbd -s lists names from kbd_layouts. IDs 400-403 are unused by stock
illumos (US-English is 33). layout_190 is hex 400, the kernel's filename
for HackHaste. Caps Lock (HID 57) still cannot become Control in a Type 6
map; same Solaris limit. Character positions including physical I → c are
in the map.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
