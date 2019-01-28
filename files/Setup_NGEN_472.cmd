@ECHO off
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :eof
set "rev=4.7.03324"
set "arch=x86"
set "guid=10C4E843-C226-3FDF-9DD6-F4E3275E734D"
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "AMD64" (
set "arch=x64"
set "guid=09CCBE8E-B964-30EF-AE84-6537AB4197F9"
)
cd /d "%~dp0"
IF NOT EXIST "%cd%\netfx_Full_%arch%.msi" GOTO :eof
if exist %windir%\Microsoft.NET\Framework\v4.0.30319\ngen.exe msiexec.exe /X{%guid%} /passive
start /wait netfx_Full_%arch%.msi NONGEN=1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v DisplayVersion /D "%rev%" /F
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v InstallSource /D "" /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v EstimatedSize /F
REG IMPORT Setup_NGEN_%arch%.reg
