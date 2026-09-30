#!/bin/sh
# Cross-compile HackHaste layout DLLs with mingw-w64 if present.
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
set -eu
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build() {
  cc="$1"; src="$2"; def="$3"; out="$4"
  "$cc" -shared -O2 -s -o "$out" "$src" "$def" \
    -nostdlib -nostartfiles \
    -Wl,--subsystem,windows -Wl,--entry,KbdLayerDescriptor \
    -Wl,--enable-stdcall-fixup || \
  "$cc" -shared -O2 -s -o "$out" "$src" "$def" \
    -Wl,--subsystem,windows -Wl,--kill-at
}
mkdir -p "$HERE/x86_64" "$HERE/i386"
if command -v x86_64-w64-mingw32-gcc >/dev/null 2>&1; then
  build x86_64-w64-mingw32-gcc "$HERE/src/kbdhaha.c" "$HERE/src/kbdhaha.def" "$HERE/x86_64/kbdhaha.dll"
  build x86_64-w64-mingw32-gcc "$HERE/src/kbdhahaleft.c" "$HERE/src/kbdhahaleft.def" "$HERE/x86_64/kbdhahaleft.dll"
  build x86_64-w64-mingw32-gcc "$HERE/src/kbdhahasl.c" "$HERE/src/kbdhahasl.def" "$HERE/x86_64/kbdhahasl.dll"
  build x86_64-w64-mingw32-gcc "$HERE/src/kbdhahalsl.c" "$HERE/src/kbdhahalsl.def" "$HERE/x86_64/kbdhahalsl.dll"
  echo "Built x86_64 DLLs"
fi
if command -v i686-w64-mingw32-gcc >/dev/null 2>&1; then
  build i686-w64-mingw32-gcc "$HERE/src/kbdhaha.c" "$HERE/src/kbdhaha.def" "$HERE/i386/kbdhaha.dll"
  build i686-w64-mingw32-gcc "$HERE/src/kbdhahaleft.c" "$HERE/src/kbdhahaleft.def" "$HERE/i386/kbdhahaleft.dll"
  build i686-w64-mingw32-gcc "$HERE/src/kbdhahasl.c" "$HERE/src/kbdhahasl.def" "$HERE/i386/kbdhahasl.dll"
  build i686-w64-mingw32-gcc "$HERE/src/kbdhahalsl.c" "$HERE/src/kbdhahalsl.def" "$HERE/i386/kbdhahalsl.dll"
  echo "Built i386 DLLs"
fi
