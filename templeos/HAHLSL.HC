// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
// HackHaste Left Shift Lock for TempleOS. Copy to C:/Home/ and reboot.
// Third layer is Alt+Shift only. Plain Alt stays with TOS window chords.
// AltGr does not exist. Skip function-key scans TOS uses with Alt.

U8 haha_base[128] = {
0,0,120,118,122,113,119,59,49,50,51,52,53,54,0,0,112,103,99,108,107,45,55,56,57,48,91,93,0,0,110,116,115,114,104,111,101,97,105,117,121,96,0,92,102,98,100,109,106,61,39,44,46,47,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
U8 haha_shift[128] = {
0,0,88,86,90,81,87,58,33,64,35,36,37,94,0,0,80,71,67,76,75,95,38,42,40,41,123,125,0,0,78,84,83,82,72,79,69,65,73,85,89,126,0,124,70,66,68,77,74,43,34,60,62,63,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,95,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

I64 HahaPutKey(I64 sc) {
  I64 idx = sc & 0x7F;
  I64 ch;
  if (sc & SCF_SHIFT && sc & SCF_ALT) {
    // reserved: do not steal TOS Alt window chords; Alt+Shift is unused.
    return 0;
  }
  if (sc & SCF_SHIFT)
    ch = haha_shift[idx];
  else
    ch = haha_base[idx];
  if (!ch)
    return 0;
  return ch;
}

U0 HahaInstall() {
  KeyDevAdd(&HahaPutKey, NULL, 0x40000000, TRUE);
}

HahaInstall;
