@echo off
REM HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
REM OS/2 / ArcaOS session install. Compile the matching .c first.
REM CONFIG.SYS DEVINFO=KBD still points at KEYBOARD.DCP; this is a
REM per-session KbdSetCustXt table, not a DCP patch.
REM HackHaste: HAHA.EXE  (table HAHA.XLT)
REM HackHaste Left: HAHAL.EXE  (table HAHAL.XLT)
REM HackHaste Shift Lock: HAHASL.EXE  (table HAHASL.XLT)
REM HackHaste Left Shift Lock: HAHLSL.EXE  (table HAHLSL.XLT)
if exist HAHA.EXE HAHA.EXE
