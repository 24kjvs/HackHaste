HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.

Software HackHaste is the Keyboard Extension in this folder.
Hardware letters stay the iOS hardware layout (typically US QWERTY, or Colemak if Apple ships it).
This extension does not intercept USB or Smart Keyboard keys.

Enable: Settings, General, Keyboard, Keyboards, Add New Keyboard, HackHaste.
Full Access stays off (no network).

Caps to Command on a hardware keyboard: Settings, General, Keyboard,
Hardware Keyboard, Modifier Keys (iPadOS 13.4+): Caps Lock = Command,
Command = Caps Lock. Control stays Control.

Optional jailbreak: overwrite a stock .uchr under
/System/Library/KeyboardLayouts. Not the default.

QMK/VIA keyboards already speak HackHaste to every OS, including iPad.

Build: open HackHaste.xcodeproj on a Mac, sign with your Apple ID, run.
This Linux workshop cannot codesign.

Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
