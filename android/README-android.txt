HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Android (4.1+) one APK: glass IME plus physical .kcm overlay.

Glass
-----
Install the APK, open HackHaste, tap "Open input method settings", enable
HackHaste, then pick it on the navigation bar. Main and Left are IME
subtypes. Shift on glass is a Shift key; it is not OS Caps to Control.
Gboard is replaced only if you select HackHaste as the input method.

Physical USB / Bluetooth
------------------------
Settings, System, Languages and input, Physical keyboard, HackHaste.
QUERY_KEYBOARD_LAYOUTS still answers. map key 58 CTRL_LEFT and map key 29
CAPS_LOCK are the Caps/Ctrl swap. Physical I is key I { base: 'c' } on main.

Root / Magisk
-------------
Copy haha.kcm to /system/usr/keychars/Vendor_XXXX_Product_YYYY.kcm.

Build
-----
  cd layout-provider
  sh ../build-hackhaste-android.sh

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
