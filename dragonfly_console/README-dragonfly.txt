HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

DragonFly BSD console is syscons(4), not FreeBSD vt(4).
Maps go in /usr/share/syscons/keymaps/. The file format is kbdmap(5)
(AT scan codes). Caps scan 058 is lctrl; Left Ctrl scan 029 is clock
(Caps Lock) on the default maps, Shift Lock (lock flag C on every
character key) on the shiftlock maps.

  kbdcontrol -l dragonfly_console/haha.iso15.acc.kbd

Permanent:

  cp haha.iso15.acc.kbd /usr/share/syscons/keymaps/
  echo 'keymap="haha.iso15.acc.kbd"' >> /etc/rc.conf.local

kbdmap(1) reads INDEX.keymaps. Append INDEX.keymaps.haha so the menu
lists HackHaste without a hand edit.

X11
---
Letters come from linux/xkb (install those symbols). DragonFly 6.4+ prefers
evdev plus libinput. If the keyboard is silent in X, set
kern.evdev.rcpt_mask (3 and 6 are the two knobs people actually use) and
use the libinput driver, not xf86-input-kbd.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
