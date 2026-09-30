@echo off
REM HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
REM Windows 95 / 98 / Me. Copies .KBD into %windir%\SYSTEM and merges the registry.
if "%WINDIR%"=="" set WINDIR=C:\WINDOWS
copy /Y kbdhaha.kbd %WINDIR%\SYSTEM\kbdhaha.kbd
copy /Y kbdhahl.kbd %WINDIR%\SYSTEM\kbdhahl.kbd
copy /Y kbdhhas.kbd %WINDIR%\SYSTEM\kbdhhas.kbd
copy /Y kbdhhls.kbd %WINDIR%\SYSTEM\kbdhhls.kbd
regedit HAHA9X.REG
echo Copied HackHaste .KBD files. Add the layout in Control Panel, Keyboard, Language.
