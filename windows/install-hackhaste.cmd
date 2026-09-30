@echo off
REM HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
REM Admin required. Works on Windows 2000 through Windows 11 (NT layout DLL).
setlocal
set SYS=%SystemRoot%\System32
set WOW=%SystemRoot%\SysWOW64
set COPIED=0
if exist "%~dp0x86_64\kbdhaha.dll" (
  copy /Y "%~dp0x86_64\kbdhaha.dll" "%SYS%\kbdhaha.dll"
  set COPIED=1
)
if exist "%~dp0i386\kbdhaha.dll" (
  if exist "%WOW%" copy /Y "%~dp0i386\kbdhaha.dll" "%WOW%\kbdhaha.dll"
  if not exist "%WOW%" copy /Y "%~dp0i386\kbdhaha.dll" "%SYS%\kbdhaha.dll"
  set COPIED=1
)
if %COPIED%==1 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b00409" /v "Layout File" /t REG_SZ /d "kbdhaha.dll" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b00409" /v "Layout Text" /t REG_SZ /d "HackHaste" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b00409" /v "Layout Id" /t REG_SZ /d "00E1" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b00409" /v "Layout Display Name" /t REG_SZ /d "HackHaste" /f
) else (
  echo Missing kbdhaha.dll. Build with mingw or the WDK first: windows\build-hackhaste-windows-dlls.sh
)
set COPIED=0
if exist "%~dp0x86_64\kbdhahaleft.dll" (
  copy /Y "%~dp0x86_64\kbdhahaleft.dll" "%SYS%\kbdhahaleft.dll"
  set COPIED=1
)
if exist "%~dp0i386\kbdhahaleft.dll" (
  if exist "%WOW%" copy /Y "%~dp0i386\kbdhahaleft.dll" "%WOW%\kbdhahaleft.dll"
  if not exist "%WOW%" copy /Y "%~dp0i386\kbdhahaleft.dll" "%SYS%\kbdhahaleft.dll"
  set COPIED=1
)
if %COPIED%==1 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b10409" /v "Layout File" /t REG_SZ /d "kbdhahaleft.dll" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b10409" /v "Layout Text" /t REG_SZ /d "HackHaste Left" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b10409" /v "Layout Id" /t REG_SZ /d "00E2" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b10409" /v "Layout Display Name" /t REG_SZ /d "HackHaste Left" /f
) else (
  echo Missing kbdhahaleft.dll. Build with mingw or the WDK first: windows\build-hackhaste-windows-dlls.sh
)
set COPIED=0
if exist "%~dp0x86_64\kbdhahasl.dll" (
  copy /Y "%~dp0x86_64\kbdhahasl.dll" "%SYS%\kbdhahasl.dll"
  set COPIED=1
)
if exist "%~dp0i386\kbdhahasl.dll" (
  if exist "%WOW%" copy /Y "%~dp0i386\kbdhahasl.dll" "%WOW%\kbdhahasl.dll"
  if not exist "%WOW%" copy /Y "%~dp0i386\kbdhahasl.dll" "%SYS%\kbdhahasl.dll"
  set COPIED=1
)
if %COPIED%==1 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b20409" /v "Layout File" /t REG_SZ /d "kbdhahasl.dll" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b20409" /v "Layout Text" /t REG_SZ /d "HackHaste Shift Lock" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b20409" /v "Layout Id" /t REG_SZ /d "00E3" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b20409" /v "Layout Display Name" /t REG_SZ /d "HackHaste Shift Lock" /f
) else (
  echo Missing kbdhahasl.dll. Build with mingw or the WDK first: windows\build-hackhaste-windows-dlls.sh
)
set COPIED=0
if exist "%~dp0x86_64\kbdhahalsl.dll" (
  copy /Y "%~dp0x86_64\kbdhahalsl.dll" "%SYS%\kbdhahalsl.dll"
  set COPIED=1
)
if exist "%~dp0i386\kbdhahalsl.dll" (
  if exist "%WOW%" copy /Y "%~dp0i386\kbdhahalsl.dll" "%WOW%\kbdhahalsl.dll"
  if not exist "%WOW%" copy /Y "%~dp0i386\kbdhahalsl.dll" "%SYS%\kbdhahalsl.dll"
  set COPIED=1
)
if %COPIED%==1 (
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b30409" /v "Layout File" /t REG_SZ /d "kbdhahalsl.dll" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b30409" /v "Layout Text" /t REG_SZ /d "HackHaste Left Shift Lock" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b30409" /v "Layout Id" /t REG_SZ /d "00E4" /f
  reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\a1b30409" /v "Layout Display Name" /t REG_SZ /d "HackHaste Left Shift Lock" /f
) else (
  echo Missing kbdhahalsl.dll. Build with mingw or the WDK first: windows\build-hackhaste-windows-dlls.sh
)
echo HackHaste registered. Add it under Settings / Control Panel: Language / Keyboard.
echo Caps Lock is Control (scancode 3A = VK_LCONTROL); Left Ctrl is Caps Lock (1D = VK_CAPITAL).
echo Win9x, DOS, and 32-bit NT 3.51/4.0: see the windows-retro zip (windows\retro).
echo ReactOS and Wine: same DLLs and registry keys, no extra tree. See README-reactos-wine.txt.
echo Live check (QWERTY-labeled board):
echo   Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
echo   Left: press S G J. The machine must type the. Press A: n. Press F: r.
echo   Shiftlock: lock on, press Q. The machine must type ^&.
echo   PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
echo   Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
echo   Apple II: letters only. Caps cannot become Open-Apple.
echo   WEB try-it: open WEB/index.html#try without installing.
echo   Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
endlocal
