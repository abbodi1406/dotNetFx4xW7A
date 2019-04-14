# .NET 4.8/4.7.2 Wintoolkit Addon for Windows 7 SP1 x86/x64

* Addon for integrating updated .NET 4.8/4.7.2 package into offline install.wim images as pre-installed.

* The addon is simply .7z file with .WA extension.

* Mainly to be used with [Wintoolkit](https://www.majorgeeks.com/files/details/win_toolkit.html), but can also be used with [Simplix UpdatePack7R2](https://blog.simplix.info/update7/).

* The addon will conflict with some Windows Updates (.NET 3.5 Family), so leave the addon's integration to the last.

* To function properly, .NET 4.8/4.7.2 require D3DCompiler_47.dll component, which is found in either the current "Monthly Quality Rollup" or "update KB4019990". It is recommended to integrate it first, or you can install it later.  
[Windows6.1-KB4019990-x64.msu](http://download.windowsupdate.com/c/msdownload/update/software/updt/2017/05/windows6.1-kb4019990-x64_35cc310e81ef23439ba0ec1f11d7b71dd34adfe5.msu)  
[Windows6.1-KB4019990-x86.msu](http://download.windowsupdate.com/c/msdownload/update/software/updt/2017/05/windows6.1-kb4019990-x86_1365fb557d5e5917cbf59b507eac066ad89ea3f7.msu)

## Extra Language Pack Addons

* Add main addon first before LangPack addon, to get ASP.NET service localization properly.

* [Download 4.8](https://github.com/abbodi1406/dotNetFx4xW7A/releases/tag/19.04.13)

* [Download 4.7.2](https://drive.google.com/open?id=1r8NJ6k8a1XTX3cbi1Kyv8BQpTE-6A-d0)

* Languages Codes Reference:  
```
ARA | Arabic  
CHS | Chinese Simplified  
CHT | Chinese Traditional  
CSY | Czech  
DAN | Danish  
DEU | German  
ELL | Greek  
ESN | Spanish  
FIN | Finnish  
FRA | French  
HEB | Hebrew  
HUN | Hungarian  
ITA | Italian  
JPN | Japanese  
KOR | Korean  
NLD | Dutch  
NOR | Norwegian  
PLK | Polish  
PTB | Portuguese (Brazil)  
PTG | Portuguese (Portugal)  
RUS | Russian  
SVE | Swedish  
TRK | Turkish
```

## Creating Addon

* Requirements:  

Clean installed Windows 7 OS without much teaks or programs, preferably in Virtual Machine.  

Repack slim installer for .NET 4.x Framework.  

Proper registry difference monitor and generator, preferably "Total Uninstall".  

Extra NGEN registry files to add Native Images Cache support.  

Simple batch scripts to harvest (collect) installed .NET files and copy it to addon directory hierarchy.  

Extra NetFxMOF.inf file to handle MOF and Perf Counters Registration after installing Windows.

* How To:  

Launch Registry monitoring program.  

Start .NET installation using command line switch **NONGEN=1**, example:  
`start /wait netfx_Full_x64.msi NONGEN=1`  

Import NGEN registry file that match the installed architecture.  

Stop Registry monitoring program and generate registry file from the difference comparasion.  

Run the batch scripts to collect the installed .NET files.  

Update Tasks.txt files with new info/version of installed .NET  

You need to manually modify the generated registry file and remove some redundant/unrelated registry keys  
i.e.  
```
change "SYSTEM\CurrentControlSet" to "SYSTEM\ControlSet001"  

remove "Microsoft\Windows NT\CurrentVersion\Perflib" key  

remove "Microsoft\ASP.NET\4.0.30319.0\CompilationMutexName" keys  

remove "LastInstallTime" value  

remove any "HKEY_CURRENT_USER" and "HKEY_USERS" keys  

change "HKEY_CLASSES_ROOT" keys to "HKEY_LOCAL_MACHINE\SOFTWARE\Classes"  

change "DisplayVersion" value in "CurrentVersion\Uninstall\{GUID-Code}" key to reflect integrated updates version  

if not exist, you must export and add "Blob" value for key "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\AuthRoot\Certificates\8F43288AD272F3103B6FB1428485EA3014C0BCFE"  
and remove any other Certificates keys
```

