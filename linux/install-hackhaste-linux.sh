#!/bin/sh
# Install HackHaste 0.2 on Linux (X11, Wayland via libxkbcommon, and TTY).
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
# Usage:
#   sudo ./install-hackhaste-linux.sh          # system xkb + console maps
#   ./install-hackhaste-linux.sh --user        # ~/.xkb for X11 without root
set -eu
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SYS_XKB=${XKB_ROOT:-/usr/share/X11/xkb}
SYS_MAP=${KBD_ROOT:-/usr/share/kbd/keymaps/i386/hackhaste}
USER_XKB="$HOME/.xkb"

install_symbols() {
  dest="$1/symbols"
  mkdir -p "$dest"
  cp "$HERE/xkb/haha" "$dest/haha"
}

install_console() {
  mkdir -p "$1"
  cp "$HERE/console/"*.map "$1/"
  for m in "$1"/*.map; do
    gzip -cf "$m" > "$m.gz"
  done
}

if [ "${1:-}" = "--user" ]; then
  install_symbols "$USER_XKB"
  mkdir -p "$USER_XKB/rules"
  # Minimal rules so setxkbmap -I"$HOME/.xkb" -layout haha works on X11.
  cat > "$USER_XKB/rules/evdev" <<'RULES'
! option = symbols
  haha = +haha
  haha(left) = +haha(left)
  haha(shiftlock) = +haha(shiftlock)
  haha(left_shiftlock) = +haha(left_shiftlock)
RULES
  echo "Installed user XKB symbols to $USER_XKB/symbols/haha"
  echo "X11: setxkbmap -I"$USER_XKB" -layout haha -print | xkbcomp -I"$USER_XKB" - $DISPLAY"
  echo "GNOME/KDE/Wayland pickers ignore ~/.xkb; use sudo $0 for those."
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
  exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
  echo "System install needs root (or pass --user)." >&2
  exit 1
fi

install_symbols "$SYS_XKB"
python3 "$HERE/register-hackhaste-xkb.py" "$SYS_XKB" || true
install_console "$SYS_MAP"

echo "Installed HackHaste 0.2."
echo "  Desktop: setxkbmap haha"
echo "           setxkbmap haha left"
echo "           setxkbmap haha shiftlock"
echo "           setxkbmap haha left_shiftlock"
echo "  GNOME:   add HackHaste in Settings → Keyboard after a session restart"
echo "  TTY:     loadkeys $SYS_MAP/haha.map"
echo "           loadkeys $SYS_MAP/haha-shiftlock.map"
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
