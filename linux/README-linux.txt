# Linux / X11 / Wayland files

HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

- `xkb/haha`: symbols: `basic`, `left`, `shiftlock`, `left_shiftlock`.
  `shiftlock` is main with physical Left Ctrl as **Shift_Lock** (every key)
  instead of Caps_Lock. `left_shiftlock` is the same overlay on left.
- `register-hackhaste-xkb.py`: idempotent evdev.xml / base.xml / .lst hook.
  Shared by the install script, the Debian postinst, the Arch `.INSTALL`,
  and the RPM `%post`. Adds missing variants on upgrade.
- `install-hackhaste-linux.sh`: copies symbols, runs the register script,
  installs console maps. `--user` installs `~/.xkb` only (no console maps,
  no Wayland/GNOME/KDE pickers).
- `arch/PKGBUILD` + `arch/hackhaste.install`: pacman source
  (`makepkg -f -d` from `arch/`). Pre-built: `dist/hackhaste-<ver>-1-any.pkg.tar.zst`.
- `rpm/hackhaste.spec`: rpmbuild source. Pre-built:
  `dist/hackhaste-<ver>-1.noarch.rpm`.
- `console/`: loadkeys maps including `haha-shiftlock.map` (also gzipped).
- `xmodmap/`: for X11 servers too old for XKB.
- `xfree86/`: XFree86 4 / X.Org 6 include path (`pc/us`).

Caps Lock is Control_L. Physical Left Ctrl is Caps_Lock on main and left.
That is a defining HackHaste difference from Colemak (Caps→Backspace)
and from QWERTY. Shift Lock on Ctrl is optional and is **not** Caps Lock:
letters, digits, and punctuation all shift.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
