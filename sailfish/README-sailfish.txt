HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Software (glass)
----------------
Copy haha.qml, haha-left.qml and the .conf files to
/usr/share/maliit/plugins/com/jolla/layouts/
then: killall maliit-server

RPM: sailfish/rpm/hackhaste.spec (Harbour/OpenRepos build is yours, same
idea as the Arch PKGBUILD).

Hardware
--------
kmap files here feed kmap2qmap. Merge the device droid.kmap / us.kmap so
volume keys survive. Backup /usr/share/qt5/keymaps/boston.qmap before you
replace it. Settings, Text input, Hardware Keyboards still list layouts
from linux/xkb as the source of truth.

MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write https://drm.cc/ . We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.
Jolla and Sony Xperia Sailfish ports: users can install the QML without
you; default-on firmware still needs you.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
