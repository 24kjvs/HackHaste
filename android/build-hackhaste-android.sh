#!/bin/sh
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
# Build the layout-provider APK (IME plus physical overlay) when aapt is present.
set -e
HERE=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
SRC="$HERE/layout-provider"
OUT="$HERE/HackHaste-android.apk"
AAPT=$(command -v aapt || true)
if [ -z "$AAPT" ] && [ -n "${ANDROID_HOME:-}" ]; then
  AAPT=$(find "$ANDROID_HOME/build-tools" -name aapt | sort | tail -n1)
fi
if [ -z "$AAPT" ]; then
  echo "aapt not found. Install Android SDK build-tools, or use the raw .kcm files."
  echo "Layout source is already complete in layout-provider/."
  exit 0
fi
ANDROID_JAR=
for d in "${ANDROID_HOME:-}" "${ANDROID_SDK_ROOT:-}" /usr/lib/android-sdk /opt/android-sdk "$HOME/Android/Sdk"; do
  [ -n "$d" ] && [ -d "$d/platforms" ] || continue
  found=$(find "$d/platforms" -name android.jar 2>/dev/null | sort | tail -n1)
  if [ -n "$found" ]; then
    ANDROID_JAR=$found
    break
  fi
done
if [ -z "$ANDROID_JAR" ]; then
  echo "android.jar not found. Install an Android SDK platform, or use the raw .kcm files."
  echo "Layout source is already complete in layout-provider/."
  exit 0
fi
"$AAPT" package -f -M "$SRC/AndroidManifest.xml" -S "$SRC/res" -I "$ANDROID_JAR" -F "$OUT"
if command -v javac >/dev/null && command -v d8 >/dev/null; then
  mkdir -p "$HERE/build/android-classes"
  javac --release 8 -cp "$ANDROID_JAR" -d "$HERE/build/android-classes" \
    "$SRC/src/cc/drm/hackhaste/InputDeviceReceiver.java" \
    "$SRC/src/cc/drm/hackhaste/HackHasteIme.java" \
    "$SRC/src/cc/drm/hackhaste/EnableImeActivity.java"
  d8 --output "$HERE/build" "$HERE/build/android-classes"/cc/drm/hackhaste/*.class
  if [ -f "$HERE/build/classes.dex" ]; then
    "$AAPT" add "$OUT" "$HERE/build/classes.dex" || true
  fi
fi
echo "Wrote $OUT (sign it before sideloading on locked devices)."
