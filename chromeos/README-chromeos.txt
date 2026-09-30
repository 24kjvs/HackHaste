HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

ChromeOS is three keyboards, not one.

1. Ash (the Chromebook UI, including the login session)
   Load extension/ unpacked at chrome://extensions (Developer mode).
   Enable HackHaste under Settings → Device → Keyboard → Input methods.
   Then Settings → Device → Keyboard: set Caps Lock key to Ctrl and Ctrl
   key to Caps Lock. The IME remaps letters by physical KeyboardEvent.code
   (KeyI → c on main). It does not replace the OS modifier map.

2. Crostini / Linux apps
   The Linux container is Linux. Install the linux/ package inside the
   container (install-hackhaste-linux.sh) and setxkbmap haha. Ash still
   uses (1). ChromeOS does not share XKB with Linux apps.

3. Dev-mode / writable root / Brunch overlays
   chromeos/xkb/symbols/haha is the same XKB file as linux/xkb/haha. Copy
   it to /usr/share/X11/xkb/symbols/haha on a device that can persist that
   path, then an input_components layouts:["haha"] extension can name it.
   Without a writable xkb tree, use (1).

This is not Android and not Windows. crosh setxkbmap affects the crosh
VT, not ash.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
