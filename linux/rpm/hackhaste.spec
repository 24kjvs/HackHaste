# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
# rpmbuild -bb --define "_sourcedir $(pwd)/linux" linux/rpm/hackhaste.spec
Name:           hackhaste
Version:        0.2
Release:        1%{?dist}
Summary:        HackHaste keyboard layout (XKB + Linux console)
License:        MIT
URL:            https://drm.cc/
BuildArch:      noarch
Source0:        xkb/haha
Source1:        register-hackhaste-xkb.py
Source2:        arch/LICENSE
Requires:       xkeyboard-config
Requires:       /usr/bin/python3
Recommends:     kbd

%description
ANSI keyboard layout with vowels UIAEO on the left home row, consonants HRSTNP on the right, digits 7-0 on the letter row, Caps Lock as Control, Left Ctrl as Caps Lock, and a Colemak-style AltGr/dead-key layer.

HackHaste (haha / haha-left / shiftlock / left_shiftlock) keeps English
vowels on the left home row and the common consonants on the right. Caps
Lock is Control. Digits 7-0 sit on the letter row. Shift-lock variants
make physical Left Ctrl a Shift_Lock (every key, not letter-only Caps).
This package installs the XKB symbols file, Linux console maps, and a
post-install hook that registers the layout in evdev.xml / base.xml.

%prep
# Files are taken from the HackHaste linux/ tree. Console maps are copied
# from console/ next to this spec's _sourcedir.

%install
rm -rf %{buildroot}
install -D -m 644 %{SOURCE0} %{buildroot}/usr/share/X11/xkb/symbols/haha
install -d %{buildroot}/usr/share/kbd/keymaps/i386/hackhaste
install -m 644 %{_sourcedir}/console/*.map %{_sourcedir}/console/*.map.gz \
  %{buildroot}/usr/share/kbd/keymaps/i386/hackhaste/
install -D -m 755 %{SOURCE1} %{buildroot}/usr/share/hackhaste/register-hackhaste-xkb.py
install -D -m 644 %{SOURCE2} %{buildroot}/usr/share/licenses/hackhaste/LICENSE

%post
/usr/bin/python3 /usr/share/hackhaste/register-hackhaste-xkb.py >/dev/null 2>&1 || :

%files
/usr/share/X11/xkb/symbols/haha
/usr/share/kbd/keymaps/i386/hackhaste/
/usr/share/hackhaste/register-hackhaste-xkb.py
/usr/share/licenses/hackhaste/LICENSE

%changelog
* Sun Sep 20 2026 Dr. Marcus Roe <nobody@drm.cc> - 0.2-1
- HackHaste 0.2 XKB + console maps for RPM-based distributions
