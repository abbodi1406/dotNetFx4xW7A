@echo off
set source=%SystemDrive%
call :get_path "%~dp0..\"
if exist "%target%\Tasks.txt" (
echo ==== ERROR ====
echo %target% already exist.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
echo.
echo Copying . . .
xcopy "%source%\Program Files\Microsoft.NET\*" "%target%\Microsoft.NET\" /cheriky >nul
xcopy "%source%\ProgramData\Microsoft\NetFramework\*" "%target%\NetFramework\" /cheriky >nul
xcopy "%source%\Windows\inf\.NET CLR Networking 4.0.0.0\*" "%target%\inf\.NET CLR Networking 4.0.0.0\" /cheriky >nul
xcopy "%source%\Windows\inf\.NET Memory Cache 4.0\*" "%target%\inf\.NET Memory Cache 4.0\" /cheriky >nul
xcopy "%source%\Windows\inf\ASP.NET\*" "%target%\inf\ASP.NET\" /cheriky >nul
xcopy "%source%\Windows\inf\ASP.NET_4.0.30319\*" "%target%\inf\ASP.NET_4.0.30319\" /cheriky >nul
xcopy "%source%\Windows\inf\aspnet_state\*" "%target%\inf\aspnet_state\" /cheriky >nul
xcopy "%source%\Windows\inf\MSDTC Bridge 4.0.0.0\*" "%target%\inf\MSDTC Bridge 4.0.0.0\" /cheriky >nul
xcopy "%source%\Windows\inf\SMSvcHost 4.0.0.0\*" "%target%\inf\SMSvcHost 4.0.0.0\" /cheriky >nul
xcopy "%source%\Windows\inf\Windows Workflow Foundation 4.0.0.0\*" "%target%\inf\Windows Workflow Foundation 4.0.0.0\" /cheriky >nul
xcopy "%source%\Windows\Installer\*" "%target%\Installer\" /cheriky >nul
xcopy "%source%\Windows\Microsoft.NET\assembly\*" "%target%\assembly\" /cheriky >nul
xcopy "%source%\Windows\Microsoft.NET\Framework\v4.0.30319\*" "%target%\v4.0.30319\" /cheriky >nul
xcopy "%source%\Windows\Migration\netfx*.inf" "%target%\Migration\" /cheriky >nul
xcopy "%source%\Windows\System32\aspnet_counters.dll" "%target%\System32\" /chriky >nul
xcopy "%source%\Windows\System32\*_clr0400.dll" "%target%\System32\" /chriky >nul
xcopy "%source%\Windows\System32\en-US\dfshim.dll.mui" "%target%\System32\en-US\" /chriky >nul
copy "%~dp0NetFxMOF.inf" "%target%\inf\" >nul
copy "%~dp0Tasks_x86.txt" "%target%\Tasks.txt" >nul
echo.
echo Done.
echo Press any key to exit.
pause >nul
goto :eof

:get_path
set "target=%~dp1dotNetFx_x86"
goto :eof
