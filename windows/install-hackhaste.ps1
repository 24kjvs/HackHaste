# HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
# Requires elevation. Registers HackHaste layout DLLs on Windows NT-class OS.
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sys = Join-Path $env:SystemRoot "System32"
$wow = Join-Path $env:SystemRoot "SysWOW64"
$layouts = @(
    @{ Dll="kbdhaha"; Klid="a1b00409"; Id="00E1"; Name="HackHaste" }
    @{ Dll="kbdhahaleft"; Klid="a1b10409"; Id="00E2"; Name="HackHaste Left" }
    @{ Dll="kbdhahasl"; Klid="a1b20409"; Id="00E3"; Name="HackHaste Shift Lock" }
    @{ Dll="kbdhahalsl"; Klid="a1b30409"; Id="00E4"; Name="HackHaste Left Shift Lock" }
)
foreach ($L in $layouts) {
    $x64 = Join-Path $here ("x86_64\" + $L.Dll + ".dll")
    $x86 = Join-Path $here ("i386\" + $L.Dll + ".dll")
    $copied = $false
    if (Test-Path $x64) { Copy-Item $x64 (Join-Path $sys ($L.Dll + ".dll")) -Force; $copied = $true }
    if (Test-Path $x86) {
        if (Test-Path $wow) { Copy-Item $x86 (Join-Path $wow ($L.Dll + ".dll")) -Force }
        else { Copy-Item $x86 (Join-Path $sys ($L.Dll + ".dll")) -Force }
        $copied = $true
    }
    if (-not $copied) {
        Write-Host ("Missing " + $L.Dll + ".dll. Build with mingw or the WDK first.")
        continue
    }
    $key = "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\" + $L.Klid
    New-Item -Path $key -Force | Out-Null
    New-ItemProperty -Path $key -Name "Layout File" -Value ($L.Dll + ".dll") -Force | Out-Null
    New-ItemProperty -Path $key -Name "Layout Text" -Value $L.Name -Force | Out-Null
    New-ItemProperty -Path $key -Name "Layout Id" -Value $L.Id -Force | Out-Null
}
Write-Host "HackHaste 0.2 registered. Sign out or add the layout in Settings."
Write-Host @'
Live check (QWERTY-labeled board):
  Main: press L H F. The machine must type the. Press I: c. Press Q: 7. Press F: e.
  Left: press S G J. The machine must type the. Press A: n. Press F: r.
  Shiftlock: lock on, press Q. The machine must type &.
  PC: Caps is Control. Caps plus I is copy (letter C). Left Ctrl is Caps (Shift Lock on shiftlock maps).
  Apple and NeXT: Caps is Command. Left Command is Caps. Control stays Control. Caps plus I is copy.
  Apple II: letters only. Caps cannot become Open-Apple.
  WEB try-it: open WEB/index.html#try without installing.
  Locked firmware (some TVs, 3270, consoles, IBM i): letters follow the PC map in the table we ship. ROM/IME remains a drm.cc offer.
'@
