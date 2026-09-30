Name:           hackhaste
Version:        0.2
Release:        1
Summary:        HackHaste keyboard for Sailfish Maliit
License:        MIT
URL:            https://drm.cc/
BuildArch:      noarch

%description
HackHaste Maliit QML layouts (main and left).

%install
mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts
install -m 644 haha.qml haha-left.qml haha.conf haha-left.conf \
  %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/

%files
/usr/share/maliit/plugins/com/jolla/layouts/haha.qml
/usr/share/maliit/plugins/com/jolla/layouts/haha-left.qml
/usr/share/maliit/plugins/com/jolla/layouts/haha.conf
/usr/share/maliit/plugins/com/jolla/layouts/haha-left.conf
