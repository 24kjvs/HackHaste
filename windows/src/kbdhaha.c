/* HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
   HackHaste Windows NT keyboard layout DLL source.
   Caps Lock scancode 0x3A is VK_LCONTROL.
   Physical Left Ctrl scancode 0x1D is VK_CAPITAL (letter Caps Lock).
   Shift-lock layouts: every key is CAPLOK (digits and punctuation too).
   Virtual keys follow HackHaste letters (physical I is VK C).
   Compile with mingw: see build-hackhaste-windows-dlls.sh
*/

/* Minimal kbd.h subset for HackHaste layout DLLs. MIT License. */
#pragma once
#include <windows.h>
#ifdef _WIN64
#define KBD_LONG_POINTER
typedef struct _KBDTABLES *PKBDTABLES;
#else
typedef struct _KBDTABLES *PKBDTABLES;
#endif
#define CAPLOK 0x01
#define WCH_NONE 0xF000
#define WCH_DEAD 0xF001
#define WCH_LGTR 0xF002
#define KBDEXT 0x100
#define KBDMULTIVK 0x200
#define KBDSPECIAL 0x400
#define KBDNUMPAD 0x800
#define MAKELONGBITS(low, high) ((DWORD)(((WORD)(low)) | ((DWORD)((WORD)(high))) << 16))
typedef struct {
    BYTE Vk;
    BYTE ModBits;
} VK_TO_BIT;
typedef struct {
    VK_TO_BIT *pVkToBit;
    WORD wMaxModBits;
    BYTE ModNumber[8];
} MODIFIERS;
typedef struct {
    BYTE VirtualKey;
    BYTE Attributes;
    WCHAR wch[4];
} VK_TO_WCHARS4;
typedef struct {
    BYTE VirtualKey;
    BYTE Attributes;
    WCHAR wch[2];
} VK_TO_WCHARS2;
typedef struct {
    VK_TO_WCHARS2 *pVkToWchars;
    BYTE nMods;
    BYTE cbSize;
} VK_TO_WCHAR_TABLE;
typedef struct {
    DWORD dwBoth;
    WCHAR wchComposed;
    USHORT uFlags;
} DEADKEY;
typedef struct {
    BYTE vsc;
    WCHAR *pwsz;
} VSC_LPWSTR;
typedef struct {
    BYTE Vsc;
    USHORT Vk;
} VSC_VK;
typedef struct _KBDTABLES {
    MODIFIERS *pCharModifiers;
    VK_TO_WCHAR_TABLE *pVkToWcharTable;
    DEADKEY *pDeadKey;
    VSC_LPWSTR *pKeyNames;
    VSC_LPWSTR *pKeyNamesExt;
    WCHAR **pKeyNamesDead;
    USHORT *pusVSCtoVK;
    BYTE bMaxVSCtoVK;
    VSC_VK *pVSCtoVK_E0;
    VSC_VK *pVSCtoVK_E1;
    DWORD fLocaleFlags;
    BYTE nLgMax;
    BYTE cbLgEntry;
    void *pLigature;
    DWORD dwType;
    DWORD dwSubType;
} KBDTABLES;
#define KBD_VERSION 1
#define KLLF_ALTGR 0x0001


static MODIFIERS CharModifiers;

static VK_TO_BIT VkToBits[] = {
    { 0x10, 1 }, /* VK_SHIFT */
    { 0x11, 2 }, /* VK_CONTROL */
    { 0x12, 4 }, /* VK_MENU AltGr = Ctrl+Alt */
    { 0, 0 }
};

static VK_TO_WCHARS4 aVkToWch4[] = {
    { 0xC0, 0, { 0x0060, 0x007E, WCH_DEAD, 0x007E } }, /* TLDE */
    { 0x31, 0, { 0x0031, 0x0021, 0x00A1, 0x00B9 } }, /* AE01 */
    { 0x32, 0, { 0x0032, 0x0040, 0x00BA, 0x00B2 } }, /* AE02 */
    { 0x33, 0, { 0x0033, 0x0023, 0x00AA, 0x00B3 } }, /* AE03 */
    { 0x34, 0, { 0x0034, 0x0024, 0x00A2, 0x00A3 } }, /* AE04 */
    { 0x35, 0, { 0x0035, 0x0025, 0x20AC, 0x00A5 } }, /* AE05 */
    { 0x36, 0, { 0x0036, 0x005E, 0x0127, 0x0126 } }, /* AE06 */
    { 0xDB, 0, { 0x005B, 0x007B, 0x00AB, 0x2039 } }, /* AE07 */
    { 0xDD, 0, { 0x005D, 0x007D, 0x00BB, 0x203A } }, /* AE08 */
    { 0x56, CAPLOK, { 0x0076, 0x0056, 0x0153, 0x0152 } }, /* AE09 */
    { 0x58, CAPLOK, { 0x0078, 0x0058, WCH_DEAD, 0x007E } }, /* AE10 */
    { 0x5A, CAPLOK, { 0x007A, 0x005A, 0x00E6, 0x00C6 } }, /* AE11 */
    { 0x51, CAPLOK, { 0x0071, 0x0051, 0x00E4, 0x00C4 } }, /* AE12 */
    { 0x37, 0, { 0x0037, 0x0026, 0x00F0, 0x00D0 } }, /* AD01 */
    { 0x38, 0, { 0x0038, 0x002A, 0x00FE, 0x00DE } }, /* AD02 */
    { 0x39, 0, { 0x0039, 0x0028, 0x2018, 0x201C } }, /* AD03 */
    { 0x30, 0, { 0x0030, 0x0029, 0x2019, 0x201D } }, /* AD04 */
    { 0xBD, 0, { 0x002D, 0x005F, 0x2013, 0x2014 } }, /* AD05 */
    { 0x4B, CAPLOK, { 0x006B, 0x004B, WCH_DEAD, 0x007E } }, /* AD06 */
    { 0x4C, CAPLOK, { 0x006C, 0x004C, 0x0142, 0x0141 } }, /* AD07 */
    { 0x43, CAPLOK, { 0x0063, 0x0043, 0x00E7, 0x00C7 } }, /* AD08 */
    { 0x47, CAPLOK, { 0x0067, 0x0047, WCH_DEAD, 0x007E } }, /* AD09 */
    { 0x59, CAPLOK, { 0x0079, 0x0059, 0x00FC, 0x00DC } }, /* AD10 */
    { 0x57, CAPLOK, { 0x0077, 0x0057, 0x00E5, 0x00C5 } }, /* AD11 */
    { 0xBA, 0, { 0x003B, 0x003A, 0x00F6, 0x00D6 } }, /* AD12 */
    { 0xDC, 0, { 0x005C, 0x007C, 0x007E, 0x007E } }, /* BKSL */
    { 0x55, CAPLOK, { 0x0075, 0x0055, 0x00FA, 0x00DA } }, /* AC01 */
    { 0x49, CAPLOK, { 0x0069, 0x0049, 0x00ED, 0x00CD } }, /* AC02 */
    { 0x41, CAPLOK, { 0x0061, 0x0041, 0x00E1, 0x00C1 } }, /* AC03 */
    { 0x45, CAPLOK, { 0x0065, 0x0045, 0x00E9, 0x00C9 } }, /* AC04 */
    { 0x4F, CAPLOK, { 0x006F, 0x004F, 0x00F3, 0x00D3 } }, /* AC05 */
    { 0x48, CAPLOK, { 0x0068, 0x0048, WCH_DEAD, 0x007E } }, /* AC06 */
    { 0x52, CAPLOK, { 0x0072, 0x0052, WCH_DEAD, 0x007E } }, /* AC07 */
    { 0x53, CAPLOK, { 0x0073, 0x0053, 0x00DF, 0x007E } }, /* AC08 */
    { 0x54, CAPLOK, { 0x0074, 0x0054, WCH_DEAD, WCH_DEAD } }, /* AC09 */
    { 0x4E, CAPLOK, { 0x006E, 0x004E, 0x00F1, 0x00D1 } }, /* AC10 */
    { 0x50, CAPLOK, { 0x0070, 0x0050, 0x00F8, 0x00D8 } }, /* AC11 */
    { 0xDE, 0, { 0x0027, 0x0022, 0x00F5, 0x00D5 } }, /* AB01 */
    { 0xBC, 0, { 0x002C, 0x003C, WCH_DEAD, 0x007E } }, /* AB02 */
    { 0xBE, 0, { 0x002E, 0x003E, WCH_DEAD, 0x007E } }, /* AB03 */
    { 0xBF, 0, { 0x002F, 0x003F, 0x00BF, 0x007E } }, /* AB04 */
    { 0xBB, 0, { 0x003D, 0x002B, 0x00D7, 0x00F7 } }, /* AB05 */
    { 0x4A, CAPLOK, { 0x006A, 0x004A, 0x0111, 0x0110 } }, /* AB06 */
    { 0x4D, CAPLOK, { 0x006D, 0x004D, WCH_DEAD, 0x007E } }, /* AB07 */
    { 0x44, CAPLOK, { 0x0064, 0x0044, WCH_DEAD, 0x007E } }, /* AB08 */
    { 0x42, CAPLOK, { 0x0062, 0x0042, WCH_DEAD, 0x007E } }, /* AB09 */
    { 0x46, CAPLOK, { 0x0066, 0x0046, 0x00E3, 0x00C3 } }, /* AB10 */
    { 0xE2, 0, { 0x002D, 0x005F, 0x2013, 0x2014 } }, /* LSGT */
    { 0x20, 0, { 0x0020, 0x0020, 0x0020, 0x00A0 } }, /* SPCE */
    { 0x20, 0, { 0x0020, 0x0020, 0x0020, 0x00A0 } },
    { 0, 0, { 0, 0, 0, 0 } }
};

static VK_TO_WCHAR_TABLE aVkToWcharTable[] = {
    { (VK_TO_WCHARS2 *)aVkToWch4, 4, sizeof(aVkToWch4[0]) },
    { 0, 0, 0 }
};

static DEADKEY aDeadKey[] = {
    { 0x03000061, 0x00E0, 0 }, /* dead_grave a -> à */
    { 0x03000065, 0x00E8, 0 }, /* dead_grave e -> è */
    { 0x03000069, 0x00EC, 0 }, /* dead_grave i -> ì */
    { 0x0300006F, 0x00F2, 0 }, /* dead_grave o -> ò */
    { 0x03000075, 0x00F9, 0 }, /* dead_grave u -> ù */
    { 0x03000041, 0x00C0, 0 }, /* dead_grave A -> À */
    { 0x03000045, 0x00C8, 0 }, /* dead_grave E -> È */
    { 0x03000049, 0x00CC, 0 }, /* dead_grave I -> Ì */
    { 0x0300004F, 0x00D2, 0 }, /* dead_grave O -> Ò */
    { 0x03000055, 0x00D9, 0 }, /* dead_grave U -> Ù */
    { 0x03010061, 0x00E1, 0 }, /* dead_acute a -> á */
    { 0x03010065, 0x00E9, 0 }, /* dead_acute e -> é */
    { 0x03010069, 0x00ED, 0 }, /* dead_acute i -> í */
    { 0x0301006F, 0x00F3, 0 }, /* dead_acute o -> ó */
    { 0x03010075, 0x00FA, 0 }, /* dead_acute u -> ú */
    { 0x03010079, 0x00FD, 0 }, /* dead_acute y -> ý */
    { 0x03010041, 0x00C1, 0 }, /* dead_acute A -> Á */
    { 0x03010045, 0x00C9, 0 }, /* dead_acute E -> É */
    { 0x03010049, 0x00CD, 0 }, /* dead_acute I -> Í */
    { 0x0301004F, 0x00D3, 0 }, /* dead_acute O -> Ó */
    { 0x03010055, 0x00DA, 0 }, /* dead_acute U -> Ú */
    { 0x03010059, 0x00DD, 0 }, /* dead_acute Y -> Ý */
    { 0x03020061, 0x00E2, 0 }, /* dead_circumflex a -> â */
    { 0x03020065, 0x00EA, 0 }, /* dead_circumflex e -> ê */
    { 0x03020069, 0x00EE, 0 }, /* dead_circumflex i -> î */
    { 0x0302006F, 0x00F4, 0 }, /* dead_circumflex o -> ô */
    { 0x03020075, 0x00FB, 0 }, /* dead_circumflex u -> û */
    { 0x03020041, 0x00C2, 0 }, /* dead_circumflex A -> Â */
    { 0x03020045, 0x00CA, 0 }, /* dead_circumflex E -> Ê */
    { 0x03020049, 0x00CE, 0 }, /* dead_circumflex I -> Î */
    { 0x0302004F, 0x00D4, 0 }, /* dead_circumflex O -> Ô */
    { 0x03020055, 0x00DB, 0 }, /* dead_circumflex U -> Û */
    { 0x03030061, 0x00E3, 0 }, /* dead_tilde a -> ã */
    { 0x0303006F, 0x00F5, 0 }, /* dead_tilde o -> õ */
    { 0x0303006E, 0x00F1, 0 }, /* dead_tilde n -> ñ */
    { 0x03030041, 0x00C3, 0 }, /* dead_tilde A -> Ã */
    { 0x0303004F, 0x00D5, 0 }, /* dead_tilde O -> Õ */
    { 0x0303004E, 0x00D1, 0 }, /* dead_tilde N -> Ñ */
    { 0x03080061, 0x00E4, 0 }, /* dead_diaeresis a -> ä */
    { 0x03080065, 0x00EB, 0 }, /* dead_diaeresis e -> ë */
    { 0x03080069, 0x00EF, 0 }, /* dead_diaeresis i -> ï */
    { 0x0308006F, 0x00F6, 0 }, /* dead_diaeresis o -> ö */
    { 0x03080075, 0x00FC, 0 }, /* dead_diaeresis u -> ü */
    { 0x03080079, 0x00FF, 0 }, /* dead_diaeresis y -> ÿ */
    { 0x03080041, 0x00C4, 0 }, /* dead_diaeresis A -> Ä */
    { 0x03080045, 0x00CB, 0 }, /* dead_diaeresis E -> Ë */
    { 0x03080049, 0x00CF, 0 }, /* dead_diaeresis I -> Ï */
    { 0x0308004F, 0x00D6, 0 }, /* dead_diaeresis O -> Ö */
    { 0x03080055, 0x00DC, 0 }, /* dead_diaeresis U -> Ü */
    { 0x030A0061, 0x00E5, 0 }, /* dead_abovering a -> å */
    { 0x030A0041, 0x00C5, 0 }, /* dead_abovering A -> Å */
    { 0x03270063, 0x00E7, 0 }, /* dead_cedilla c -> ç */
    { 0x03270043, 0x00C7, 0 }, /* dead_cedilla C -> Ç */
    { 0x03040061, 0x0101, 0 }, /* dead_macron a -> ā */
    { 0x03040065, 0x0113, 0 }, /* dead_macron e -> ē */
    { 0x03040069, 0x012B, 0 }, /* dead_macron i -> ī */
    { 0x0304006F, 0x014D, 0 }, /* dead_macron o -> ō */
    { 0x03040075, 0x016B, 0 }, /* dead_macron u -> ū */
    { 0x03060061, 0x0103, 0 }, /* dead_breve a -> ă */
    { 0x03060041, 0x0102, 0 }, /* dead_breve A -> Ă */
    { 0x0307007A, 0x017C, 0 }, /* dead_abovedot z -> ż */
    { 0x0307005A, 0x017B, 0 }, /* dead_abovedot Z -> Ż */
    { 0x030C0063, 0x010D, 0 }, /* dead_caron c -> č */
    { 0x030C0073, 0x0161, 0 }, /* dead_caron s -> š */
    { 0x030C007A, 0x017E, 0 }, /* dead_caron z -> ž */
    { 0x030C0043, 0x010C, 0 }, /* dead_caron C -> Č */
    { 0x030C0053, 0x0160, 0 }, /* dead_caron S -> Š */
    { 0x030C005A, 0x017D, 0 }, /* dead_caron Z -> Ž */
    { 0x03280061, 0x0105, 0 }, /* dead_ogonek a -> ą */
    { 0x03280065, 0x0119, 0 }, /* dead_ogonek e -> ę */
    { 0x03280041, 0x0104, 0 }, /* dead_ogonek A -> Ą */
    { 0x03280045, 0x0118, 0 }, /* dead_ogonek E -> Ę */
    { 0x030B006F, 0x0151, 0 }, /* dead_doubleacute o -> ő */
    { 0x030B0075, 0x0171, 0 }, /* dead_doubleacute u -> ű */
    { 0x030B004F, 0x0150, 0 }, /* dead_doubleacute O -> Ő */
    { 0x030B0055, 0x0170, 0 }, /* dead_doubleacute U -> Ű */
    { 0, 0, 0 }
};

static USHORT ausVSCtoVK[] = { 0xFF, 0x1B, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0xDB, 0xDD, 0x56, 0x58, 0x5A, 0x51, 0x08, 0x09, 0x37, 0x38, 0x39, 0x30, 0xBD, 0x4B, 0x4C, 0x43, 0x47, 0x59, 0x57, 0xBA, 0x0D, 0x14, 0x55, 0x49, 0x41, 0x45, 0x4F, 0x48, 0x52, 0x53, 0x54, 0x4E, 0x50, 0xC0, 0x10, 0xDC, 0xDE, 0xBC, 0xBE, 0xBF, 0xBB, 0x4A, 0x4D, 0x44, 0x42, 0x46, 0x10, 0xFF, 0x12, 0x20, 0xA2, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xE2, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };

static VSC_VK aE0[] = { { 0x1D, 0xA3 }, { 0x38, 0xA5 }, { 0, 0 } };
static VSC_VK aE1[] = { { 0, 0 } };

static WCHAR *aKeyNamesDead[] = { 0 };

static KBDTABLES KbdTables = {
    &CharModifiers,
    aVkToWcharTable,
    aDeadKey,
    0, 0,
    aKeyNamesDead,
    ausVSCtoVK,
    (BYTE)(sizeof(ausVSCtoVK)/sizeof(ausVSCtoVK[0])),
    aE0, aE1,
    KLLF_ALTGR,
    0, 0, 0,
    4 /* TYPE */, 0
};

__declspec(dllexport) PKBDTABLES KbdLayerDescriptor(void) {
    /* Bit combos 0,1,6,7 -> columns none, shift, AltGr, AltGr+shift.
       Ctrl-only (bit 2) stays on column 0 so Ctrl+letter uses the VK, not ú. */
    CharModifiers.pVkToBit = VkToBits;
    CharModifiers.wMaxModBits = 7;
    CharModifiers.ModNumber[0] = 0;
    CharModifiers.ModNumber[1] = 1;
    CharModifiers.ModNumber[2] = 0;
    CharModifiers.ModNumber[3] = 1;
    CharModifiers.ModNumber[4] = 0;
    CharModifiers.ModNumber[5] = 1;
    CharModifiers.ModNumber[6] = 2;
    CharModifiers.ModNumber[7] = 3;
    return &KbdTables;
}
