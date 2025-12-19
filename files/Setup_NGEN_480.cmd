@echo off
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :eof
set "rev=4.8.04798"
set "arch=x86"
set "guid=B29F8740-372B-312F-8EEE-18FF857CCBB8"
if /i "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
set "arch=x64"
set "guid=16735AF7-1D8D-3681-94A5-C578A61EC832"
)
cd /d "%~dp0"
if not exist "%cd%\netfx_Full_%arch%.msi" goto :eof
if exist %windir%\Microsoft.NET\Framework\v4.0.30319\ngen.exe msiexec.exe /X{%guid%} /passive
start /wait netfx_Full_%arch%.msi NONGEN=1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v DisplayVersion /d "%rev%" /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v InstallSource /d "" /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v InstallDate /d "" /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{%guid%} /v EstimatedSize /f
reg import Setup_NGEN_%arch%.reg
exit /b

 /passive /norestart /MSIOPTIONS "NONGEN=1"
