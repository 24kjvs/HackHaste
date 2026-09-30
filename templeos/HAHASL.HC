// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
// HackHaste Shift Lock for TempleOS. Copy to C:/Home/ and reboot.
// Third layer is Alt+Shift only. Plain Alt stays with TOS window chords.
// AltGr does not exist. Skip function-key scans TOS uses with Alt.

U8 haha_base[128] = {
0,0,49,50,51,52,53,54,91,93,118,120,122,113,0,0,55,56,57,48,45,107,108,99,103,121,119,59,0,0,117,105,97,101,111,104,114,115,116,110,112,96,0,92,39,44,46,47,61,106,109,100,98,102,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
U8 haha_shift[128] = {
0,0,33,64,35,36,37,94,123,125,86,88,90,81,0,0,38,42,40,41,95,75,76,67,71,89,87,58,0,0,85,73,65,69,79,72,82,83,84,78,80,126,0,124,34,60,62,63,43,74,77,68,66,70,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,95,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
