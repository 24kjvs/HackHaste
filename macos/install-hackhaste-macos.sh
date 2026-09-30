#!/bin/sh
# Install HackHaste 0.2 on macOS / Mac OS X 10.2+.
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
set -eu
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DEST="$HOME/Library/Keyboard Layouts"
mkdir -p "$DEST"
cp -R "$HERE/HackHaste.bundle" "$DEST/"
echo "Copied HackHaste.bundle to $DEST"
echo "Log out and back in, then enable HackHaste in:"
echo "  10.10+:  System Settings/Preferences → Keyboard → Input Sources"
echo "  10.6-9:  Language & Text → Input Sources"
echo "  10.2-5:  International → Input Menu"
echo
echo "Caps Lock ↔ Left Command is NOT in the .keylayout (macOS forbids it)."
echo "  Default and Shift Lock layouts both need the swap: Caps → Command and"
echo "  Left Command → Caps. Control stays Control."
echo "  Copy $HERE/com.hackhaste.capscmd.plist to"
echo "           ~/Library/LaunchAgents/ then: launchctl load that plist"
echo "  Shift Lock layouts: the .keylayout maps caps onto Shift (all keys)."
echo "           You can load com.hackhaste.cmdshiftlock.plist instead;"
echo "           the hidutil mapping is the same. Do not load both."
echo "  Unload any leftover com.hackhaste.capsctrl.plist (old Caps↔Control)."
echo "  10.3+:   Keyboard → Modifier Keys → Caps Lock = Command, Command = Caps Lock"
echo
echo 'Live check (QWERTY-labeled board):'
echo '  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.'
echo '  Left: press S G J. The machine must type the. Press A: n. Press F: r.'
echo '  Shiftlock: lock on, press Q. The machine must type &.'
echo '  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).'
echo '  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.'
echo '  Apple II: letters only. Caps cannot become Open-Apple.'
echo '  WEB try-it: open WEB/index.html#try without installing.'
echo '  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.'
