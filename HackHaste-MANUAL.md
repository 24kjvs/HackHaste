# HackHaste MANUAL

*Expedited Typing Across* **OS***es* *Integrated Natively Salvaging Home Rows*

![HackHaste](source/visuals/hackhaste-hh-logo.png)

Version **0.2**. MIT License. Dr. Marcus Roe, [drm.cc](https://drm.cc/).
Identifiers: `haha` / `haha-left` / `haha-shiftlock` / `haha-left-shiftlock`.

The porch and the doctrine of the keys are in [README.md](README.md). This file is the workshop: the maps, the modifiers, and the machinery that installs them.

The sections that follow are not the doctrine. They are how to bolt it onto a machine: all variants of Linux, all vintages of macOS, every version of Windows, the BSDs, DragonFly syscons, Solaris, illumos, Amiga, BeOS, Classic Mac, DOS, OS/2, Plan 9, RISC OS, Atari, NeXTSTEP, Android (glass IME and physical), ChromeOS, Windows CE, iOS Keyboard Extension, webOS, TempleOS, Palm, Windows Mobile, BlackBerry, Symbian, Newton, IBM 3270, game consoles that took keyboards seriously, Sailfish, Tizen, IBM i, enterprise Unix still in shops, and a humble Apple II remapper.

---



## 1. What is ostensibly 'unusual' about this layout

> If you would improve, be content to be thought foolish and dull with regard to externals.
>
> - Epictetus, *Enchiridion* 13

HackHaste is not Colemak, not Dvorak, and not “QWERTY with a few swaps.” Anyone that treats it as a letter-only remap will be wrong. The differences of HaHa are very serious and foundational.


| Rule                 | HackHaste                                             | Colemak                   | QWERTY                  |
| -------------------- | ------------------------------------------------------- | ------------------------- | ----------------------- |
| Home vowels          | Left: **U I A E O**                                     | Split across both hands   | Left A; rest scattered  |
| Home consonants      | Right: **H R S T N P**                                  | RSTDhn mix                | ASDF / JKL              |
| Caps Lock            | **Control** (Command on Macintosh / NeXT)               | Backspace                 | Caps Lock               |
| Digits 7-0           | **On the letter row** (physical QWERTY Q-R)             | Number row                | Number row              |
| Rare letters V X Z Q | Number row                                              | Bottom / middle           | Bottom / top            |
| Brackets `[ ]`       | Number row (main after `6`); physical `[ ]` on left      | Top-right                 | Top-right               |
| AltGr                | Dead keys and Latin letters, **on the letter produced** | Same idea, different keys | Usually none on US      |
| ISO extra (`<LSGT>`) | `-` `_` en-dash em-dash                                 | Same                      | `<` `>` on many locales |


**Main home row** (physical Caps through Enter):

```
Ctrl  U  I  A  E  O  H  R  S  T  N  P  Enter
```

**Main number / letter rows** (physical QWERTY positions):

```
` 1 2 3 4 5 6 [ ] V X Z Q  Backspace
    7 8 9 0 - K L C G Y W ;  \
      U I A E O H R S T N P
        ' , . / = J M D B F
```

macOS still binds some shortcuts by hardware keycode and that is an OS limit.

---



## 2. Left-hand variant (`haha-left`)

> Men exist for the sake of one another. Teach them then or bear with them.
>
> - Marcus Aurelius, *Meditations* 8.59

Left is a **geometric hand-swap**, not a one-handed chord layout:

```
` X V Z Q W ; 1 2 3 4 5 6  Backspace
    P G C L K - 7 8 9 0 [ ]
      N T S R H O E A I U Y
        F B D M J = ' , . /
```

Home row: `Ctrl N T S R H O E A I U Y Enter`.

**Ctrl+X V Z C** stay as a pack: `X V Z` on physical `1 2 3`, `C` on physical `E` (Z sits above C). **Q** is the extra rare at the end of that attic, on physical `4`, directly above **L**. **W** sits where `[` used to (physical `5`); **Y** takes the extra home pinky (physical `'`). Grave/tilde is on its QWERTY island. `[ ]` live on the physical bracket keys, immediately after `0`. Semicolon/colon sits on physical `6`, next to `1-6`.

AltGr still follows the **letter**. U on the right home row still produces `ú` / `Ú` on AltGr, not the layer that used to sit on QWERTY P. Q still produces `ä` / `Ä`; Y still produces `ü` / `Ü`.

---



## 2.1 Shift Lock subvariants (`shiftlock`, `left_shiftlock`)

> …what is a hindrance is made a furtherance, and what is an obstacle on the road helps us on this road.
>
> - Marcus Aurelius, *Meditations* 5.20

Physical **Left Ctrl** is **Caps Lock** (letters) on the default main and left layouts (a swap, not two Controls). The shiftlock variants make that same key a typewriter **Shift Lock**: digits, punctuation, the lot. Physical Caps and R-Ctrl are still Control. The shift-lock subvariants keep that swap of the Caps *key* onto Control, and upgrade the lock on Left Ctrl from timid Caps Lock to a typewriter Shift Lock. On Macintosh, Darwin, iOS, Classic Mac, and NeXT, the partner of Caps is **Left Command**, not Left Control. Control stays in the corner.

`setxkbmap haha` / `setxkbmap haha shiftlock`


| Selection                       | What it is                                                |
| ------------------------------- | --------------------------------------------------------- |
| `setxkbmap haha`                | Main letters. Caps → Control. **Left Ctrl → Caps_Lock**.  |
| `setxkbmap haha left`           | Left-hand letters. Same modifiers.                        |
| `setxkbmap haha shiftlock`      | Main letters. Caps → Control. **Left Ctrl → Shift_Lock**. |
| `setxkbmap haha left_shiftlock` | Left-hand letters. Same Shift Lock overlay.               |


**Shift_Lock is not Caps_Lock.** Under XKB, `Caps_Lock` sets the Lock modifier, which only keys of type ALPHABETIC notice. `Shift_Lock` locks the **Shift** modifier, so every TWO_LEVEL and FOUR_LEVEL key goes to its shifted column: `7`→`&`, `/`→`?`, `[`→`{`. That is the whole point.

How each OS is told:


| Platform             | Physical Left Ctrl becomes                                | All keys (not letters-only)?                           |
| -------------------- | --------------------------------------------------------- | ------------------------------------------------------ |
| Linux XKB / Wayland  | `<LCTL>` → `Shift_Lock`, mapped as Shift                  | Yes - see snippet below                                |
| Linux console        | `keycode 29 = Shift_Lock`                                 | Yes                                                    |
| xmodmap              | keycode 37 = Shift_Lock                                   | Often letters-only without XKB                         |
| Windows NT DLL / KLC | scancode `0x1D` → `VK_CAPITAL`; **CAPLOK on every key**   | Yes                                                    |
| Win9x `.kbd`         | SHIFTLOCKUSED flag; Caps VK is Control                    | Yes - letters plus symbols in CP1252                   |
| DOS `HAHASL.COM`     | LCtrl swallows; sticky BIOS left-shift at `0040:0017`     | Yes - IBM AT 8042 only                                 |
| macOS                | hidutil Caps↔Left Command; `.keylayout` maps `caps` onto Shift | Yes, with `com.hackhaste.cmdshiftlock.plist`        |
| Haiku / BeOS         | CapsLock = physical LCtrl `0x5c`; Caps column = Shift     | Yes                                                    |
| FreeBSD              | scan 029 = `clock`; lock flag `C` on all character keys   | Yes                                                    |
| DragonFly            | syscons `kbdmap(5)` in `dragonfly_console/` plus `INDEX.keymaps.haha`; X11 is linux/xkb + libinput/evdev | Yes                                                    |
| NetBSD / OpenBSD     | `keycode 29 = Shift_Lock`                                 | Yes                                                    |
| Classic Mac          | Caps table = Shift table; INIT 128 Caps↔Command           | Physical Command is Shift Lock; Control stays Control  |
| Amiga                | Caps bitmap includes every character key                  | Caps Lock key is Shift Lock; Control stays a qualifier |
| Solaris / illumos    | `caps` field = shift for every HID key                    | Caps row only; Control not remapped                    |
| NeXTSTEP `.keymapping` | ALPHALOCK on every key’s shifted character              | Yes - ACE PC map                                       |
| Android `.kcm`       | `map key 29 CAPS_LOCK`; `capslock:` on every key          | Yes                                                    |
| ChromeOS IME         | Caps Lock in Settings is still letters; use OS Caps→Ctrl  | Letters in IME; digits if you pick shiftlock + capslock |
| Windows CE           | `caplok` on every VKeyToWchar row                         | Yes                                                    |
| OS/2 XLT / Plan 9 / RISC OS / Atari | n/a                                            | No - 8-bit character tables only                       |
| Apple II             | n/a                                                       | No. Hardware Caps is letters-only                      |


Linux XKB (replacing the keysym alone leaves `pc`’s Control map on that key):

```
replace key <LCTL> { [ Shift_Lock ], type[group1] = "ONE_LEVEL" };
modifier_map Shift { Shift_Lock };
```

Do not load both macOS hidutil plists. Both swap Caps↔Left Command. The Shift Lock layouts also map the caps table onto Shift in the `.keylayout`. Unload leftover `com.hackhaste.capsctrl.plist` (old Caps↔Control).

---



## 3. Layers

> Look inwards: let not the peculiar quality of anything nor its value escape thee.
>
> - Marcus Aurelius, *Meditations* 6.3

Every desktop format that can express it has four levels per key:

1. Base
2. Shift
3. AltGr / Option / Right Alt (XKB level3, Windows Ctrl+Alt, macOS Option)
4. AltGr+Shift / Option+Shift

Dead keys (tilde, acute, grave, circumflex, diaeresis, caron, cedilla, ogonek, macron, breve, abovedot, abovering, doubleacute) come from Colemak’s international layer. Retro systems that only have 8-bit character sets get Latin-1 approximations or ASCII-only remaps; see the per-OS limits below.

---



## 4. Caps Lock → Control matrix

> Of things some are in our power, and others are not. In our power are opinion, movement toward a thing, desire, aversion; and in a word, whatever are our own acts: not in our power are the body, property, reputation, office, and in a word, whatever are not our own acts.
>
> - Epictetus, *Enchiridion* 1

This is a defining HackHaste difference. Not every OS lets a keyboard layout file change modifier identity.


| Platform              | How Caps becomes Control                                      | In the layout file?                                           |
| --------------------- | ------------------------------------------------------------- | ------------------------------------------------------------- |
| Linux XKB / Wayland   | Caps `<CAPS>` → `Control_L`; Left Ctrl `<LCTL>` → `Caps_Lock` | Yes                                                           |
| Linux console         | `keycode 58 = Control`; `keycode 29 = Caps_Lock`              | Yes                                                           |
| xmodmap               | keycode 66 = Control_L; keycode 37 = Caps_Lock                | Yes                                                           |
| Windows NT DLL / KLC  | scancode `0x3A` → `VK_LCONTROL`; `0x1D` → `VK_CAPITAL`        | Yes                                                           |
| Win9x `.kbd`          | Caps scancode `3A` → VK_CONTROL; `1D` → VK_CAPITAL            | Yes - `windows/retro/win9x/`                                  |
| DOS `HAHA.COM`        | INT 9 remaps `3A`→`1D`, `1D`→`3A`                             | Yes - IBM AT and later                                        |
| macOS `.keylayout`    | **Impossible** in the layout                                  | No - hidutil Caps↔Left Command (10.12+) or Modifier Keys Caps Lock = Command, Command = Caps Lock (10.3+) |
| Classic Mac KCHR/uchr | **Impossible** in KCHR                                        | No - INIT 128 Caps↔Command on all four suitcases              |
| BeOS / Haiku          | `CapsLock = 0x5c` (LCtrl), `LControl = 0x3b` (Caps)           | Yes                                                           |
| Amiga keymap          | Qualifier, not a character                                    | No - optional `haha-capsctrl.asm` commodity                   |
| Apple II              | Hardware Caps Lock                                            | No (cannot become Open-Apple)                             |
| Solaris Type 6        | Cannot remap HID 57 as Control in the map                     | No - see console notes                                        |
| DragonFly             | scan 058 = `lctrl`; scan 029 = `clock`                        | Yes (syscons; not FreeBSD vt)                             |
| illumos Type 6        | Same HID 57 limit as Solaris                                  | No                                                            |
| ReactOS / Wine        | Same NT DLL as Windows                                        | Yes - no extra tree                                           |
| NeXTSTEP              | Caps scan `0x3A` is COMMAND; L-Command `0x5B` is ALPHALOCK    | Yes - `nextstep/*.keymapping`                                 |
| Android               | `map key 58 CTRL_LEFT`; `map key 29 CAPS_LOCK`                | Yes - `.kcm` overlay                                          |
| iOS / iPadOS          | Settings Modifier Keys: Caps Lock = Command, Command = Caps Lock | No - extension cannot remap hardware modifiers            |
| ChromeOS ash          | Settings → Device → Keyboard (Caps key = Ctrl, Ctrl = Caps)   | No - IME is letters only                                      |
| Windows CE            | scan `0x3A` → `VK_LCONTROL`; `0x1D` → `VK_CAPITAL`            | Yes - `wince/*.cpp`                                           |
| OS/2 / Plan 9 / RISC OS / Atari | Character tables only                                 | No                                                            |


---



## 5. Installation

> Therefore whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock.
>
> - Matthew 7:24



### Repository layout

```
index.html                door to the GitHub Pages house (WEB/)
404.html                  missing plate
.nojekyll                 GitHub Pages: do not run Jekyll
LICENSE                   MIT grant (keep this file with the maps)
README.md                 porch
MARKETING.md              public pitch
HackHaste-MANUAL.md     this file
WEB/                      GitHub Pages house (author-owned; generator copies only)
LEARNING HACKHASTE/       mnemonics + gtypist/KTouch/Klavaro/… tutor files
source/visuals/           HH bindrune logo (SVG + PNG) + typing-cluster layout boards
linux/                    XKB, XFree86, xmodmap, console, install + XKB register
linux/arch/               PKGBUILD + .install (pacman) + LICENSE
linux/rpm/                hackhaste.spec (rpmbuild)
macos/                    HackHaste.bundle + hidutil LaunchAgent plist
windows/                  .klc, WDK-style C, installers (DLLs if mingw is present)
windows/retro/            DOS .COM, Win9x .KBD, 32-bit NT i386 DLLs + REGEDIT4
freebsd_console/          FreeBSD
dragonfly_console/        DragonFly BSD syscons + INDEX.keymaps.haha + X11/libinput note
netbsd_console/           NetBSD
openbsd_console/          OpenBSD
solaris_console/          Solaris Type 6
illumos_console/          illumos / OpenIndiana Type 6
amiga/                    hunk keymap + assembler
beos/                     Haiku text keymap + BeOS binary Key_map
classicmac/               MacBinary suitcase (KCHR + uchr + INIT)
apple2/                   6502 remapper, ProDOS .po image
os2/                      OS/2 / ArcaOS KbdSetCustXt table + loader
plan9/                    Plan 9 / 9front kbmap
riscos/                   RISC OS MoreKeys + IntKey fragment
atari/                    TOS/MiNT KEYTBL.TBL
nextstep/                 NeXTSTEP / OPENSTEP .keymapping (KYM1)
android/                  physical .kcm + layout-provider APK (IME + QUERY_KEYBOARD_LAYOUTS)
chromeos/                 ash IME extension + XKB copy for crostini/dev-mode
wince/                    Windows CE PS2_AT / IL sources + .reg
ios/                      iOS/iPadOS Keyboard Extension + host app (no hardware remap)
webos/                    Palm/HP Pre 10-key fold + LG webOS TV company-help
templeos/                 HolyC HomeKeyPlugIns tables
palm/                     Palm OS Graffiti/Treo tables (no fake .prc)
windowsmobile/            WM5 SIP table + WP7 in-app XAML (cannot replace SIP)
blackberryQMK/            BBOS fold + BB10 Java listener + BBQ10 QMK note
symbian/                  EKA2 HID table + EPOC KeyMap.ini
newton/                   Newton KCHR table + NewtonScript stub
ibm3270/                  PCOMM .kmp + x3270 keymap + company-help
consoles/                 HID/KOS tables for machines that took keyboards seriously
sailfish/                 Maliit QML + .conf + kmap + RPM spec
tizen/                    wearable Web IME + native ISE table
ibmi/                     IBM i Access Client Solutions .kmp
enterprise/               AIX, HP-UX, OpenVMS, SCO, QNX, Tru64 company-help
dist/                     zip/tar, .deb, .pkg.tar.zst, .rpm
```

These are the files that ship. The maps in `linux/`, `macos/`, `windows/`, and the other OS trees **are** the layout. Install them; do not look for a rebuild script in the packages.

The public site is `[WEB/](WEB/)`. Root `index.html` is only the door. GitHub Pages: deploy the public repo (`dist/`) from branch folder `/ (root)`. The generator copies `WEB/`; it never writes inside it. Workshop for the site: `[WEB/HackHaste-WEB-MANUAL.md](WEB/HackHaste-WEB-MANUAL.md)`. Night is the site default (`data-hh-theme="night"` on the root, `localStorage` key `hh-theme`).

### Layout boards

`source/visuals/hackhaste-haha.png` and `hackhaste-haha-left.png` (and the matching `.kle.json`) are the typing cluster: number row through space. HackHaste does not remap the F-row, the Insert/Home/PgUp island, the cursor keys, or the numpad, so those plates are omitted. Physical Caps is labelled Ctrl; physical Left Ctrl is labelled Caps; Right Alt is AltGr. Choir home keys wear a gold underline; engine home keys wear a steel underline. Bone bezels keep the iron plates visible on night paper, day paper, and GitHub’s light porch. The live board on the site is the same cluster.

Fingers after install: `[LEARNING HACKHASTE/](LEARNING%20HACKHASTE/)` holds [MNEMONICS.md](LEARNING%20HACKHASTE/MNEMONICS.md), [MNEMONICS-LEFT.md](LEARNING%20HACKHASTE/MNEMONICS-LEFT.md), and tutor files for GNU Typist, KTouch, Klavaro, TIPP10, TuxType, Amphetype, Monkeytype, keybr, and the rest. Catalogue: [LEARNING.md](LEARNING%20HACKHASTE/LEARNING.md).

Identifiers: layout `haha`, variants `left`, `shiftlock`, `left_shiftlock`. Windows DLLs `kbdhaha.dll` / `kbdhahaleft.dll` / `kbdhahasl.dll` / `kbdhahalsl.dll`, KLIDs `a1b00409` / `a1b10409` / `a1b20409` / `a1b30409`. macOS bundle id `com.apple.keyboardlayout.hackhaste` (Apple’s required prefix for installable layouts, TN2056).

### Packages (I've only tested .deb, so all of these may fail)

Archives in `[dist/](dist/)`:


| Archive                              | Platform                                              |
| ------------------------------------ | ----------------------------------------------------- |
| `HackHaste-0.2-linux.tar.gz`       | X11, Wayland, Linux TTY                               |
| `hackhaste_0.2_all.deb`            | Debian / Ubuntu                                       |
| `hackhaste-0.2-1-any.pkg.tar.zst`  | Arch / pacman                                         |
| `hackhaste-0.2-1.noarch.rpm`       | Fedora / RHEL / openSUSE                              |
| `HackHaste-0.2-macos.zip`          | Mac OS X 10.2 through current macOS                   |
| `HackHaste-0.2-windows.zip`        | Windows NT/2000 through 11 (compile DLL if mingw/WDK) |
| `HackHaste-0.2-windows-retro.zip`  | DOS 3.3-6.22, Windows 95/98/Me, 32-bit NT 3.51/4.0    |
| `HackHaste-0.2-bsd-solaris.tar.gz` | FreeBSD, DragonFly, NetBSD, OpenBSD, Solaris, illumos |
| `HackHaste-0.2-extra-os.zip`       | OS/2, Plan 9, RISC OS, Atari, NeXT, Android (IME+physical), ChromeOS, CE, webOS, TempleOS, Palm, WM, BlackBerry, Symbian, Newton, 3270, consoles, Sailfish, Tizen, IBM i, enterprise Unix |
| `HackHaste-0.2-ios.zip`            | iOS / iPadOS Keyboard Extension + host app            |
| `HackHaste-0.2-amiga.zip`          | AmigaOS / MorphOS / AROS                              |
| `HackHaste-0.2-beos.zip`           | BeOS R5 and Haiku                                     |
| `HackHaste-0.2-classicmac.zip`     | Mac OS 7 / 8 / 9                                      |
| `HackHaste-0.2-apple2.zip`         | Apple II ASCII remapper + ProDOS disk                 |


```
# any Linux with a root shell
cd linux && sudo ./install-hackhaste-linux.sh && setxkbmap haha

# Debian family
sudo dpkg -i dist/hackhaste_0.2_all.deb

# Arch
sudo pacman -U dist/hackhaste-0.2-1-any.pkg.tar.*

# Fedora / RHEL / openSUSE
sudo rpm -i dist/hackhaste-0.2-1.noarch.rpm
```

---



## 6. Linux (X11, Wayland, TTY)

**Widest path:** copy `[linux/xkb/haha](linux/xkb/haha)` to `/usr/share/X11/xkb/symbols/haha` and register it in `evdev.xml`.

```
cd linux
sudo ./install-hackhaste-linux.sh
setxkbmap haha
setxkbmap haha left
setxkbmap haha shiftlock
setxkbmap haha left_shiftlock
```

GNOME / KDE / most Wayland compositors read **system** xkb-data. Log out after the install script patches `evdev.xml`, then add “HackHaste” as an input source. `~/.xkb` (`./install-hackhaste-linux.sh --user`) copies symbols into the home tree for X11 `xkbcomp` only. It does **not** install console maps, and GNOME / KDE / Wayland pickers will ignore it.

TTY:

```
sudo loadkeys linux/console/haha.map
# or haha-left.map
```

`*.map.gz` files are **plain gzip** of the map (0.1 shipped ustar-in-gzip of the wrong layout).

Old X11 without XKB: `xmodmap linux/xmodmap/xmodmap.haha`.
XFree86 4 / X.Org 6: `linux/xfree86/haha` (includes `pc/us(basic)`).

The three Linux distro packages above are the same payload: XKB symbols, console maps, register hook. All three call `linux/register-hackhaste-xkb.py` after unpack (Debian `postinst`, Arch `.INSTALL` `post_install`, RPM `%post`). That script is idempotent: it inserts the `haha` / `left` entries into `evdev.xml` / `base.xml` and the matching `.lst` files if they are not already there. It does not try to un-patch on remove; a leftover layout name is harmless, a greedy XML edit is not.

To rebuild a distro package from the shipped `linux/` tree: `makepkg -f -d` from `linux/arch/`, or `rpmbuild -bb` with `_sourcedir` pointed at `linux/` (see `linux/rpm/hackhaste.spec`). Pre-built files are already in `dist/`.

Changelog:

We don't talk about "v 0.1"... This is an alpha, please do not expect beta-level results. 0.1 failed on the desktop because:

1. XKB used the invalid keysym `Control` instead of `Control_L`.
2. There were no `evdev.xml` / `.lst` rules, so `setxkbmap us haha` could not see the layout.
3. The left XKB file was a copy of main.

---



## 7. macOS (10.2 through current)

XML `.keylayout` is the format that has worked since Jaguar (TN2056).

1. Run `macos/install-hackhaste-macos.sh` or copy `HackHaste.bundle` to `~/Library/Keyboard Layouts/` (or `/Library/Keyboard Layouts/` for all users).
2. Log out and back in.
3. Enable **HackHaste** / **HackHaste Left**:
  - 10.10+: Keyboard → Input Sources
  - 10.6-10.9: Language & Text → Input Sources
  - 10.2-10.5: International → Input Menu

**Caps Lock ↔ Left Command is not in the** `.keylayout`**.** macOS treats those keys as modifiers outside the layout. Control stays Control.

- 10.12+: copy `com.hackhaste.capscmd.plist` to `~/Library/LaunchAgents/` and `launchctl load` it (`hidutil` swaps Caps ↔ Left Command).
- 10.3-10.11: Keyboard → Modifier Keys → Caps Lock = Command, Command = Caps Lock.
- Unload leftover `com.hackhaste.capsctrl.plist` if it is still loaded (that was Caps↔Control).

Option is AltGr. After the Command swap, copy/paste live on the Caps pinky (Cmd+letter). Some shortcuts still follow a physical keycode; there is no layout-file fix for that.

A Linux-built `.pkg` is not used. The zip of the bundle is the compatible package.

---



## 8. Windows (NT 4 / 2000 through Windows 11)

MSKLC 1.4’s bundled 2007 compiler produces DLLs that crash Explorer on Windows 11. 0.2 ships **WDK-style C** plus `.klc` source instead.

- `windows/src/kbdhaha.c` / `kbdhahaleft.c`: `KbdLayerDescriptor`, `/NOENTRY`
- `windows/src/*.klc`: for people who still want MSKLC as an editor
- `windows/install-hackhaste.cmd` and `.ps1`: admin install (registers a layout only after its DLL was copied)
- `windows/build-hackhaste-windows-dlls.sh`: mingw-w64 cross compile

Caps scancode `0x3A` is `VK_LCONTROL`. Left Ctrl `0x1D` is `VK_CAPITAL`. Physical I is virtual-key **C**.

If `x86_64-w64-mingw32-gcc` is on the PATH, `windows/build-hackhaste-windows-dlls.sh` writes `windows/x86_64/*.dll`. Compile on a Windows box with the WDK sample, or install mingw and run that script. `install-hackhaste.cmd` and `.ps1` copy a DLL first (`COPIED` / `$copied`); they skip `reg add` and print `Missing kbdhaha.dll` if mingw or WDK has not produced it.

Install (elevated):

```
windows\install-hackhaste.cmd
```

Then add HackHaste under Language / Keyboard settings. Unique `Layout Id` values are `00E1` and `00E2`.

---



## 8.1 Windows Retro (DOS, 9x, 32-bit NT)

> Time is a sort of river of passing events, and strong is its current.
>
> - Marcus Aurelius, *Meditations* 4.43

The main `windows/` zip is NT 2000 through 11 (x86_64 and i386 `KbdLayerDescriptor` DLLs). **DOS, Windows 95/98/Me, and 32-bit NT 3.51/4.0** are `[windows/retro/](windows/retro/)` and `dist/HackHaste-0.2-windows-retro.zip`.

**DOS 3.3 through 6.22, PC-DOS, FreeDOS, a Win9x DOS box** (IBM AT keyboard controller, not XT):

```
windows\retro\dos\HAHA.COM
```

Run once per boot (`AUTOEXEC.BAT`). It hooks INT 9, rewrites Set-1 scancodes through 8042 command `D2h`, and chains BIOS. Physical I becomes C. Caps becomes Ctrl. `HAHAL.COM` is the left-hand swap. `HAHASL.COM` / `HAHLSL.COM` swallow Left Ctrl and stick the BIOS left-shift flag (`0040:0017`) so every key shifts. No AltGr.

**Windows 95 / 98 / Me:** copy `windows/retro/win9x/*.kbd` to `%windir%\SYSTEM`, run `INSTALL.BAT` (or `REGEDIT HAHA9X.REG`), then Control Panel → Keyboard → Language and add HackHaste. These are DDK `.KBD` data files (magic `DS`), not NT DLLs. Code page 1252; dead keys are omitted.

**32-bit Windows NT 3.51 / 4.0:** copy `windows/retro/nti386\kbdhaha.dll` (and the left/shiftlock siblings) into `%SystemRoot%\SYSTEM32`, then `REGEDIT /s HAHANT4.REG`. NT 4 has no `reg add`. Windows 2000/XP 32-bit can use this folder or `windows\install-hackhaste.cmd`. The DLLs are the same i386 `KbdLayerDescriptor` binaries as `windows/i386/`; they appear when `i686-w64-mingw32-gcc` is on the PATH (or compile the shipped `windows/src/*.c` with the WDK).

---



## 8.2 ReactOS and Wine (same binaries)

> It is not the man who has too little, but the man who craves more, that is poor.
>
> - Seneca, *Letters* 2.6

No extra tree. ReactOS and Wine load the NT `KbdLayerDescriptor` DLLs already in `[windows/](windows/)`. `[windows/README-reactos-wine.txt](windows/README-reactos-wine.txt)` is the whole note: copy `kbdhaha.dll` into System32 (ReactOS) or `drive_c/windows/system32` (Wine), then the same `Keyboard Layouts\a1b00409` values `install-hackhaste.cmd` writes. Wine: one copy per prefix. ReactOS does not run the Win9x `.KBD` or DOS `.COM`; those stay in `[windows/retro/](windows/retro/)`.

---



## 9. BSD and Solaris

Same letter map as Linux console, Colemak-1.0 file shapes:


| OS        | File                                  | Install                                                                   |
| --------- | ------------------------------------- | ------------------------------------------------------------------------- |
| FreeBSD   | `freebsd_console/haha.iso15.acc.kbd`  | `kbdcontrol -l` / `/usr/share/syscons/keymaps/`                           |
| DragonFly | `dragonfly_console/haha.iso15.acc.kbd` plus `INDEX.keymaps.haha` | syscons `kbdcontrol -l` / `kbdmap(1)`; X11 is `[linux/xkb](linux/xkb)` + libinput/evdev (`kern.evdev.rcpt_mask` 3 vs 6). Not FreeBSD vt. |
| NetBSD    | `netbsd_console/pckbd.haha.iso8859-1` | copy to `/usr/share/wscons/keymaps/`, set `mapfile` in `/etc/wscons.conf` |
| OpenBSD   | `openbsd_console/haha_openbsd.sh`     | `sh haha_openbsd.sh` (`wsconsctl`)                                        |
| Solaris   | `solaris_console/type_6/haha`         | USB Type 6 console map; Caps cannot become Control here                   |
| illumos   | `illumos_console/type_6/haha`         | `loadkeys`; append `kbd_layouts.haha`; kernel file `layout_190` (id 400)  |


Left variants use the `haha-left` filename.

---



## 10. Amiga (AmigaOS 2/3, MorphOS, AROS)

`[amiga/haha](amiga/haha)` and `[amiga/haha-left](amiga/haha-left)` are relocatable hunk keymaps (`HUNK_HEADER` 0x3F3) plus matching assembler.

- Kickstart 1.x / 2.0: copy to `DEVS:Keymaps`, run `SetMap haha`
- Workbench 2.1+: copy to `KEYMAPS:`, pick it in Input preferences

Alt is the third level. Dead keys that need Unicode do not exist; Latin-1 bytes are stored in the vanilla keymap entries.

Caps Lock is an `input.device` qualifier. Optional `[amiga/haha-capsctrl.asm](amiga/haha-capsctrl.asm)` is a commodity stub; assemble with SAS/C or gcc for Amiga if you want Caps→Control.

---



## 11. BeOS R5 and Haiku

- Haiku: `[beos/haha.keymap](beos/haha.keymap)` Version 3 text. `keymap -c < haha.keymap` then open `keymap.out` in Keymap preferences.
- BeOS R5 Intel: copy `[beos/haha.Key_map](beos/haha.Key_map)` to `~/config/settings/Key_map` and reboot.

Caps Lock **is** Control and Left Ctrl **is** Caps Lock: `CapsLock = 0x5c`, `LControl = 0x3b`. Option maps carry the AltGr layer.

---



## 12. Classic Mac OS 7 / 8 / 9

`[classicmac/HackHaste.bin](classicmac/HackHaste.bin)` is MacBinary III of a suitcase containing:

- `'KCHR'`: MacRoman, OS 7+
- `'uchr'`: Unicode, OS 8.5+
- `'KBDN'`: menu name
- `'INIT'` 128: Caps↔Command GetKeys patch on all four suitcases (remove it if you only want character remap)

Decode with StuffIt Expander / MacBinary, drop in the System Folder, reboot, choose HackHaste in the Keyboard control panel.

Option approximates AltGr in MacRoman. Glyphs that do not exist in MacRoman become `?`. 68k INIT source: `[classicmac/haha-capscmd-init.asm](classicmac/haha-capscmd-init.asm)`. Physical Caps is Command. Physical Command is Caps Lock (typewriter Shift Lock on the shiftlock suitcases). Control stays Control.

---



## 13. Apple II (IIe / IIc / IIgs under ProDOS)

There is no Unicode, no AltGr, and Caps Lock is hardware (it cannot become Open-Apple). The package is an **ASCII remapper**, not a full desktop layout.

- `[apple2/HAHA.BIN](apple2/HAHA.BIN)` / `HAHALEFT.BIN`: page-3 hook (`$0300` install, `$0310` KEYIN wrapper, `$0380` 128-byte table)
- `[apple2/HACKHASTE.po](apple2/HACKHASTE.po)`: 140K ProDOS-order image
- 40-column cards: `HAHA.TXT` / `HAHALEFT.TXT`

ProDOS 8 + BASIC.SYSTEM: `BRUN HAHA.BIN` (patches `VECTIN` at `$BE32`).
DOS 3.3: load at `$300`, then `POKE 56,16: POKE 57,3: CALL 1002`.

Physical Q becomes `7`, physical I becomes `c`, matching the main layout. IIgs GS/OS native Event Manager path is **not** covered by this ProDOS hook.

---



## 14. OS/2 and ArcaOS

> Adapt yourself to the things among which your lot has been cast.
>
> - Marcus Aurelius, *Meditations* 6.39

OS/2 does not load NT DLLs. The system layout is `KEYBOARD.DCP` via `DEVINFO=KBD` in `CONFIG.SYS`. This package does not patch DCP.

`[os2/HAHA.XLT](os2/HAHA.XLT)` is a 256-byte `KbdSetCustXt` table (Set-1 scancode → Latin-1). Physical I (`0x17`) is `c`. `[os2/haha.c](os2/haha.c)` loads it for the current session (Open Watcom / kLIBC). `INSTALL.CMD` runs `HAHA.EXE` if you compiled it. Caps↔Ctrl is a Keyboard-object setting, not an XLT field.

---



## 15. Plan 9 and 9front

> Very little is needed to make a happy life; it is all within yourself, in your way of thinking.
>
> - Marcus Aurelius, *Meditations* 7.67

`[plan9/haha](plan9/haha)` is a `kbmap(3)` file: table, scancode, rune. Copy to `/sys/lib/kbmap/haha`, then `cat /sys/lib/kbmap/haha > /dev/kbmap`. 9front: `kbmap=haha` in `plan9.ini`. Tables: `0` none, `1` shift, `3` altgr, `4` ctl, `7` shift+altgr. Physical I is `'c`; table 4 on that key is `^C`. Caps and Ctrl are kernel modifiers; kbmap cannot swap them.

---



## 16. RISC OS

> No man is free who is not master of himself.
>
> - Epictetus, fragment

`[riscos/mappings/UK/HackHaste](riscos/mappings/UK/HackHaste)` is a MoreKeys mapping (Set-1 scancode, unshift, shift, ctrl, alt as hex). Copy to `Choices:MoreKeys.mappings.UK.HackHaste`, then `*Country UK`. `[riscos/IntKey/haha](riscos/IntKey/haha)` is a comment-form fragment for rebuilding InternationalKeyboard. Caps stays a RISC OS lock.

---



## 17. Atari TOS / MiNT

> Let your speech be always with grace, seasoned with salt.
>
> - Colossians 4:6

`[atari/HAHA.TBL](atari/HAHA.TBL)` is a TOS 5+ / FreeMiNT `KEYTBL.TBL`: magic `0x2771`, three 128-byte tables, then Alternate lists. Copy to `\MULTITOS\KEYTBL.TBL` or `/mint/KEYTBL.TBL` and reboot. Physical I (IKBD `0x17`) is `c`. Only one table is live; pick `HAHA.TBL` / `HAHAL.TBL` / `HAHASL.TBL` / `HAHLSL.TBL`. IKBD Caps and Control are TOS modifiers, not table entries.

---



## 18. NeXTSTEP / OPENSTEP

> Waste no more time arguing about what a good man should be. Be one.
>
> - Marcus Aurelius, *Meditations* 10.16

`[nextstep/HackHaste.keymapping](nextstep/HackHaste.keymapping)` is a `KYM1` ACE (PC) map (dumpkeymap). Copy to `/LocalLibrary/Keyboards/` or `~/Library/Keyboards/`. Caps `0x3A` is COMMAND; Left Command / GUI `0x5B` is ALPHALOCK; Left Ctrl `0x1D` and RCtrl `0x5D` stay CONTROL. Shiftlock variants put ALPHALOCK on every key’s shifted character. Intel/USB only; 68k ADB is a different interface (native Command-beside-space is the same idea).

---



## 19. Android

> Study to be quiet, and to do your own business.
>
> - 1 Thessalonians 4:11

One APK, two keyboards: glass IME and physical overlay. Package `cc.drm.hackhaste`. Not a second app.

1. **Software (Gboard is not this):** the same `[android/layout-provider/](android/layout-provider/)` tree is an `InputMethodService`. `HackHasteIme.java` inflates `[android/layout-provider/res/xml/haha.xml](android/layout-provider/res/xml/haha.xml)` (and `haha_left.xml`) onto a `KeyboardView`. After install: Settings → System → Languages & input → On-screen keyboard → Manage keyboards → HackHaste. The launcher activity opens that screen. `KeyboardView` is deprecated at API 29; it is still the smallest OEM-free IME.
2. **Physical, no root:** the same APK answers `QUERY_KEYBOARD_LAYOUTS`. Plug in USB/Bluetooth, then Settings → Physical keyboard → HackHaste.
3. **Root / Magisk:** copy `[android/haha.kcm](android/haha.kcm)` to `/system/usr/keychars/Vendor_XXXX_Product_YYYY.kcm` for that keyboard.
4. **Raw maps:** `type OVERLAY`. `map key 58 CTRL_LEFT`, `map key 29 CAPS_LOCK`. Physical I is `key I { base: 'c' }`. Shiftlock lists `capslock:` on every key, including digits.

`sh android/build-hackhaste-android.sh` if `aapt` is on the PATH; otherwise compile that tree in Android Studio.

---



## 20. ChromeOS

> Let your communication be, Yea, yea; Nay, nay.
>
> - Matthew 5:37

ChromeOS is three keyboards.

1. **Ash** (the Chromebook UI): load `[chromeos/extension/](chromeos/extension/)` unpacked at `chrome://extensions`. Enable HackHaste as an input method. Then Settings → Device → Keyboard: Caps Lock key = Ctrl, Ctrl key = Caps Lock. The IME remaps `KeyboardEvent.code` (`KeyI` → `c`). It does not replace the OS modifier map.
2. **Crostini:** install the Linux package *inside* the container and `setxkbmap haha`. Ash still uses (1).
3. **Dev-mode writable XKB:** `[chromeos/xkb/symbols/haha](chromeos/xkb/symbols/haha)` is the Linux symbols file. Copy it to `/usr/share/X11/xkb/symbols/haha` only if that path persists. `crosh` `setxkbmap` is the crosh VT, not ash.

---



## 21. Windows CE

> Men seek retreats for themselves, houses in the country, sea-shores, and mountains.
>
> - Marcus Aurelius, *Meditations* 4.3

CE will not load desktop `kbdhaha.dll`. `[wince/kbdhaha.cpp](wince/kbdhaha.cpp)` is the Platform Builder pair: `PS2_AT_<klid>` (scan → VK) and `IL_<klid>` (VK → Unicode). Merge `[wince/kbdhaha.reg](wince/kbdhaha.reg)`. Physical I is `VK_C`. Caps `0x3A` is `VK_LCONTROL`. If you already have an XP `kbdhaha.dll`, `kbdgen` can emit the same split; keep KLIDs `a1b00409`-`a1b30409`. Desktop Windows stays `[windows/](windows/)`.

---



## 22. iOS / iPadOS

> The impediment to action advances action. What stands in the way becomes the way.
>
> - Marcus Aurelius, *Meditations* 5.20

Apple does not let a third-party app replace the hardware USB / Smart Keyboard map. `[ios/](ios/)` is a Keyboard Extension plus a host app that only tells you how to enable it. Open `HackHaste.xcodeproj`, sign it, run the host, then Settings → General → Keyboard → Keyboards → Add New Keyboard → HackHaste. Caps→Command on an iPad keyboard is Settings → General → Keyboard → Hardware Keyboard → Modifier Keys (iPadOS 13.4+): Caps Lock = Command, Command = Caps Lock. Control stays Control. Hardware *letters* stay QWERTY unless Apple adds a Custom Keyboard Layout API. The generated table is `[ios/HackHasteKeys.swift](ios/HackHasteKeys.swift)`: main `AC04` is `e`. Packed as `HackHaste-0.2-ios.zip` (not inside extra-os).

---



## 23. webOS (Pre, and LG TVs)

> If you wish to be a writer, write.
>
> - Epictetus

`[webos/kb_config-haha.json](webos/kb_config-haha.json)` is a 10-key Palm Pre fold: vowels on the left cluster, consonants on the right, digits where the Pre put them. Copy into `/usr/share/X11/xkb` or the Luna keyboard config only on an unlocked Pre / HP TouchPad. LG webOS TVs keep a locked system IME. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 24. TempleOS

> In the beginning was the Word, and the Word was with God, and the Word was God.
>
> - John 1:1

`[templeos/HAHA.HC](templeos/HAHA.HC)` (and `HAHAL`, `HAHASL`, `HAHLSL`) is a HolyC `U8` table for `KeyDevAdd`. `[templeos/HomeKeyPlugIns.HC](templeos/HomeKeyPlugIns.HC)` is the include you drop in `~/HomeKeyPlugIns.HC`. Third layer is **Alt+Shift**, not plain Alt: TempleOS uses Alt for window chords. Rebuild with Adam or `#include` from the home plugin.

---



## 25. Palm OS

> Do not waste the remainder of thy life in thoughts about others.
>
> - Marcus Aurelius, *Meditations* 3.4

No fake `.prc`. `[palm/haha-millikeys.txt](palm/haha-millikeys.txt)` is a Graffiti / Millikeys fold. `[palm/haha-treo.txt](palm/haha-treo.txt)` is the Treo 5-row thumb board. Compile on a Palm SDK if you still have one.

---



## 26. Windows Mobile / Windows Phone

> First say to yourself what you would be; and then do what you have to do.
>
> - Epictetus, *Discourses* 3.23

`[windowsmobile/haha-sip.c](windowsmobile/haha-sip.c)` is an `IInputMethod` character table for Windows Mobile 5/6 SIP. `[windowsmobile/HackHastePhone.xaml](windowsmobile/HackHastePhone.xaml)` is an in-app WP7 keyboard. WP7 cannot replace the system SIP. Read `[windowsmobile/README-windowsmobile.txt](windowsmobile/README-windowsmobile.txt)`.

---



## 27. BlackBerry

> No great thing is created suddenly.
>
> - Epictetus

`[blackberryQMK/haha-bbos7-fold.txt](blackberryQMK/haha-bbos7-fold.txt)` is the BBOS 7 physical fold. `[blackberryQMK/HahaKeyListener.java](blackberryQMK/HahaKeyListener.java)` is a BB10 Cascades listener (BB10 cannot intercept the system keyboard). BBQ10 hardware is a QMK board: flash from the QMK repo, do not invent a BlackBerry firmware blob here.

---



## 28. Symbian

> If it is not right, do not do it: if it is not true, do not say it.
>
> - Marcus Aurelius, *Meditations* 12.17

`[symbian/haha-kbdlayout.cpp](symbian/haha-kbdlayout.cpp)` maps HID usage to Unicode for EKA2. `[symbian/haha-epoc.ini](symbian/haha-epoc.ini)` is EPOC `KeyMap` lines. Caps as Control needs a signed layout DLL on a given phone; the table is the honest part.

---



## 29. Newton

> Prove all things; hold fast that which is good.
>
> - 1 Thessalonians 5:21

`[newton/haha-newton-kchr.txt](newton/haha-newton-kchr.txt)` is a Newton KCHR fold. `[newton/HahaInstall.newtonscript](newton/HahaInstall.newtonscript)` is a stub. No fake `.pkg`.

---



## 30. IBM 3270

> That which is not good for the hive cannot be good for the bee.
>
> - Marcus Aurelius, *Meditations* 6.54

`[ibm3270/haha.kmp](ibm3270/haha.kmp)` is a PCOMM `KeyRemap` with PF1-12 on the digit cluster. `[ibm3270/keymap.haha](ibm3270/keymap.haha)` is x3270. Letters follow the PC map; 3270 functions stay on PF keys. Locked terminal firmware is not a GitHub zip. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 31. Game consoles

> The universe is change; our life is what our thoughts make it.
>
> - Marcus Aurelius, *Meditations* 4.3

`[consoles/](consoles/)` holds HID folds for machines that shipped a real keyboard (Dreamcast HKT-4000, PS2 USB, GameCube ASCII, Xbox Duke chatpad as HID, Switch USB, Steam Deck uses `[linux/](linux/)`, CD32 uses `[amiga/](amiga/)`). `[consoles/haha-kos.c](consoles/haha-kos.c)` is KallistiOS. We did not patch Horizon / Orbis. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 32. Sailfish OS

> Make the best use of what is in your power, and take the rest as it happens.
>
> - Epictetus, *Enchiridion* 1

`[sailfish/haha.qml](sailfish/haha.qml)` plus `[sailfish/haha.conf](sailfish/haha.conf)` (`name=HackHaste`) go in `/usr/share/maliit/plugins/com/jolla/layouts/`. Hardware: `[sailfish/haha.kmap](sailfish/haha.kmap)` via `ckbcomp` / `kmap2qmap`. Do not overwrite `boston.qmap` without a backup. `[sailfish/rpm/hackhaste.spec](sailfish/rpm/hackhaste.spec)` is the RPM. Jolla’s locked IME, if any, is the same company offer as the TVs. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 33. Tizen

> Look well into thyself; there is a source of strength which will always spring up.
>
> - Marcus Aurelius, *Meditations* 7.59

`[tizen/web-ime/](tizen/web-ime/)` is a wearable Web IME: `config.xml` has `tizen:category` `ime`, uuid `cc0d0000-2026-4000-8000-00c04fd430c8`. `[tizen/haha-ise.c](tizen/haha-ise.c)` is a native ISE table. Samsung TVs keep a locked system IME. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 34. IBM i

> Let all things be done decently and in order.
>
> - 1 Corinthians 14:40

`[ibmi/IBMi-haha.kmp](ibmi/IBMi-haha.kmp)` is ACS `[KeyRemap]`. Letters follow the PC layout; 5250 functions stay on the emulator’s PF map. Locked 5250 firmware is company-help, same sentence as 3270.

---



## 35. Enterprise Unix still in shops

> Begin at once to live, and count each separate day as a separate life.
>
> - Seneca, *Letters* 101

`[enterprise/README-enterprise.txt](enterprise/README-enterprise.txt)` is the index: AIX `keycomp` source, HP-UX ITE, OpenVMS DECW$KEYMAP, SCO `mapkey`, QNX Photon, Tru64 xkb/xmodmap. IRIX, NonStop, and MCP get the same offer and no fake binaries. X11 letters are `[linux/xkb](linux/xkb)` / `[linux/xmodmap](linux/xmodmap)`. MIT License. If you still ship this OS (TVs, phones, cars, terminals, mainframes, Unix boxes), write [drm.cc](https://drm.cc/). We will help put HackHaste in the firmware, the IME, or the emulator. Users cannot patch a locked vendor keyboard from GitHub.

---



## 37. Live-machine checks

> First say to yourself what you would be; then do what you have to do.
>
> - Epictetus, *Discourses*

Automated tests on this workshop Linux box parse the maps. They do not boot a guest OS. After you install on a real machine, or on a VM you already have, type these probes on a QWERTY-labeled board.

**Gold table**

- Main: physical `L H F` types `the`. Physical `I` types `c`. Physical `Q` types `7`. Physical `F` types `e`.
- Left: physical `S G J` types `the`. Physical `A` types `n`. Physical `F` types `r`.
- Shiftlock: lock on, physical `Q` types `&`.
- PC modifiers: Caps is Control; physical `I` plus Caps is copy (letter C). Left Ctrl is Caps (or Shift Lock).
- Apple / NeXT: Caps is Command; Left Command is Caps; Control stays Control; physical `I` plus Caps is copy.
- Apple II: letters only; Caps cannot become Open-Apple.

The same paragraph is at the end of every generated `README-*.txt`, and at the end of `macos/install-hackhaste-macos.sh`, `windows/install-hackhaste.cmd` / `.ps1`, and `linux/install-hackhaste-linux.sh`. WEB try-it ([WEB/index.html](WEB/index.html)#try) remaps physical QWERTY in the browser without installing.

**Index (README or installer that carries the live check)**

- Linux: [linux/README-linux.txt](linux/README-linux.txt) (`setxkbmap haha`, then LHF)
- macOS: [macos/install-hackhaste-macos.sh](macos/install-hackhaste-macos.sh)
- Windows NT: [windows/install-hackhaste.cmd](windows/install-hackhaste.cmd) / [windows/install-hackhaste.ps1](windows/install-hackhaste.ps1)
- Windows Retro: [windows/retro/README-windows-retro.txt](windows/retro/README-windows-retro.txt)
- ReactOS / Wine: [windows/README-reactos-wine.txt](windows/README-reactos-wine.txt)
- FreeBSD / DragonFly: [dragonfly_console/README-dragonfly.txt](dragonfly_console/README-dragonfly.txt) (maps also in `freebsd_console/`)
- NetBSD / OpenBSD / Solaris / illumos: [illumos_console/README-illumos.txt](illumos_console/README-illumos.txt) plus `netbsd_console/`, `openbsd_console/`, `solaris_console/`
- Amiga: `amiga/Install-HackHaste` (SetMap; gold is still LHF / I→c)
- BeOS / Haiku: [beos/README-beos.txt](beos/README-beos.txt)
- Classic Mac: [classicmac/README-classicmac.txt](classicmac/README-classicmac.txt)
- Apple II: [apple2/README-apple2.txt](apple2/README-apple2.txt)
- OS/2 / ArcaOS: [os2/README-os2.txt](os2/README-os2.txt)
- Plan 9 / 9front: [plan9/README-plan9.txt](plan9/README-plan9.txt)
- RISC OS: [riscos/README-riscos.txt](riscos/README-riscos.txt)
- Atari: [atari/README-atari.txt](atari/README-atari.txt)
- NeXTSTEP: [nextstep/README-nextstep.txt](nextstep/README-nextstep.txt)
- Android: [android/README-android.txt](android/README-android.txt)
- ChromeOS: [chromeos/README-chromeos.txt](chromeos/README-chromeos.txt)
- Windows CE: [wince/README-wince.txt](wince/README-wince.txt)
- iOS / iPadOS: [ios/README-ios.txt](ios/README-ios.txt)
- webOS: [webos/README-webos.txt](webos/README-webos.txt)
- TempleOS: [templeos/README-templeos.txt](templeos/README-templeos.txt)
- Palm: [palm/README-palm.txt](palm/README-palm.txt)
- Windows Mobile: [windowsmobile/README-windowsmobile.txt](windowsmobile/README-windowsmobile.txt)
- BlackBerry: [blackberryQMK/README-blackberry.txt](blackberryQMK/README-blackberry.txt)
- Symbian: [symbian/README-symbian.txt](symbian/README-symbian.txt)
- Newton: [newton/README-newton.txt](newton/README-newton.txt)
- IBM 3270: [ibm3270/README-ibm3270.txt](ibm3270/README-ibm3270.txt)
- Consoles: [consoles/README-consoles.txt](consoles/README-consoles.txt)
- Sailfish: [sailfish/README-sailfish.txt](sailfish/README-sailfish.txt)
- Tizen: [tizen/README-tizen.txt](tizen/README-tizen.txt)
- IBM i: [ibmi/README-ibmi.txt](ibmi/README-ibmi.txt)
- Enterprise Unix: [enterprise/README-enterprise.txt](enterprise/README-enterprise.txt)

**VMs (run if you have the guest, not CI)**

FreeBSD / DragonFly `kbdcontrol -l`; NetBSD / OpenBSD `wsconsctl`; Solaris / illumos `loadkeys`; Haiku Keymap; Amiga SetMap; DOSBox `HAHA.COM`; Wine prefix plus `kbdhaha.dll`; ReactOS; ArcaOS; 9front `cat > /dev/kbmap`.

**Locked firmware**

LG webOS TV, Samsung Tizen TV, IBM 3270 firmware, consoles (Horizon / Orbis), IBM i 5250 firmware: letters follow the PC map in the emulator or table we ship. Firmware remains a [drm.cc](https://drm.cc/) offer. A GitHub zip does not remap the ROM.



## 38. License

> That which is not good for the bee-hive cannot be good for the bee.
>
> - Marcus Aurelius, *Meditations* 6.54

MIT License. The grant is [LICENSE](LICENSE): keep that file with the maps. SPDX: MIT. Distro packages install the same text at `/usr/share/licenses/hackhaste/LICENSE`. Author: Dr. Marcus Roe, [drm.cc](https://drm.cc/).

This is all ALPHA software, so it is distributed freely without warranty. As with any software, if you did not get the installer from the author's official service (GitHub) or through a trustworthy repository, do not run it.