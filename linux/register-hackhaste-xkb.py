#!/usr/bin/env python3
# Register HackHaste in XKB rules (evdev.xml / base.xml and matching .lst).
# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
# Usage:
#   register-hackhaste-xkb.py              # patch /usr/share/X11/xkb
#   register-hackhaste-xkb.py /path/to/xkb
#   register-hackhaste-xkb.py evdev.xml evdev.lst
from __future__ import annotations
import pathlib
import re
import sys

VARIANTS = [
    ("left", "HackHaste Left"),
    ("shiftlock", "HackHaste (Shift Lock on Ctrl)"),
    ("left_shiftlock", "HackHaste Left (Shift Lock on Ctrl)"),
]

XML_LAYOUT = """    <layout>
      <configItem>
        <name>haha</name>
        <shortDescription>haha</shortDescription>
        <description>HackHaste</description>
        <languageList><iso639Id>eng</iso639Id></languageList>
      </configItem>
      <variantList>
        <variant>
          <configItem>
            <name>left</name>
            <description>HackHaste Left</description>
          </configItem>
        </variant>
        <variant>
          <configItem>
            <name>shiftlock</name>
            <description>HackHaste (Shift Lock on Ctrl)</description>
          </configItem>
        </variant>
        <variant>
          <configItem>
            <name>left_shiftlock</name>
            <description>HackHaste Left (Shift Lock on Ctrl)</description>
          </configItem>
        </variant>
      </variantList>
    </layout>
"""


def variant_xml(name, desc):
    return (
        "        <variant>\n"
        "          <configItem>\n"
        "            <name>" + name + "</name>\n"
        "            <description>" + desc + "</description>\n"
        "          </configItem>\n"
        "        </variant>\n"
    )


def patch_xml(path):
    if not path.is_file():
        return
    text = path.read_text(encoding="utf-8")
    if "<name>haha</name>" not in text:
        needle = "</layoutList>"
        if needle not in text:
            return
        path.write_text(text.replace(needle, XML_LAYOUT + needle, 1), encoding="utf-8")
        return
    start = text.find("<name>haha</name>")
    close = text.find("</variantList>", start)
    if close == -1:
        return
    extra = ""
    chunk = text[start:close]
    for name, desc in VARIANTS:
        if "<name>" + name + "</name>" in chunk:
            continue
        extra += variant_xml(name, desc)
    if extra:
        path.write_text(text[:close] + extra + text[close:], encoding="utf-8")


def patch_lst(path):
    if not path.is_file():
        return
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)
    out = []
    inserted_layout = bool(re.search(r"^  haha\s", text, flags=re.M))
    for line in lines:
        if (not inserted_layout) and line.startswith("! variant"):
            out.append("  haha            HackHaste\n")
            out.append("\n")
            inserted_layout = True
        out.append(line)
    joined = "".join(out)
    for item in (
        "  left            haha: HackHaste Left\n",
        "  shiftlock       haha: HackHaste (Shift Lock on Ctrl)\n",
        "  left_shiftlock  haha: HackHaste Left (Shift Lock on Ctrl)\n",
    ):
        if item.strip() not in joined:
            out.append(item)
            joined += item
    path.write_text("".join(out), encoding="utf-8")


def main(argv):
    targets = argv or ["/usr/share/X11/xkb"]
    for raw in targets:
        path = pathlib.Path(raw)
        if path.is_file() and path.suffix == ".xml":
            patch_xml(path)
            continue
        if path.is_file() and path.suffix == ".lst":
            patch_lst(path)
            continue
        rules = path / "rules" if path.is_dir() else path
        for name in ("evdev.xml", "base.xml"):
            patch_xml(rules / name)
        for name in ("evdev.lst", "base.lst"):
            patch_lst(rules / name)


if __name__ == "__main__":
    try:
        main(sys.argv[1:])
    except OSError:
        sys.exit(0)
