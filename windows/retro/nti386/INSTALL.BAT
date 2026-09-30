@echo off
REM HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
REM 32-bit Windows NT 3.51 / 4.0 / 2000 / XP. Run from this nti386 folder.
if exist kbdhaha.dll copy /Y kbdhaha.dll %SystemRoot%\SYSTEM32\kbdhaha.dll
if exist kbdhahaleft.dll copy /Y kbdhahaleft.dll %SystemRoot%\SYSTEM32\kbdhahaleft.dll
if exist kbdhahasl.dll copy /Y kbdhahasl.dll %SystemRoot%\SYSTEM32\kbdhahasl.dll
if exist kbdhahalsl.dll copy /Y kbdhahalsl.dll %SystemRoot%\SYSTEM32\kbdhahalsl.dll
regedit /s HAHANT4.REG
echo Registered. Pick HackHaste under Keyboard / Regional Settings.
