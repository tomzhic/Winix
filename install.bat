@echo on

rem if you do want to install any package, just rem it
::set cygwin=1
::set cmder=1
::set python=1
::set mobaxterm=1
::set adbputty=1
::set notepadpp=1
::set sublime=1
::set hfs=1
::set everything==1
::set listary==1
::set markdownpad==1
::set fastcopy==1
set vbs2exe=1
set bat2exe=1
::set clean=1

set WINIXROOT=D:\Winix

set SCRIPT_PATH=%~dp0
set UNZIPPER=%SCRIPT_PATH%\tools\unzip.exe

set CYGWIN_ROOT=%WINIXROOT%\Cygwin

rem set WINIXROOT to env
wmic ENVIRONMENT where "name='WINIXROOT'" delete
wmic ENVIRONMENT create name="WINIXROOT",username="<system>",VariableValue="%WINIXROOT%"

if defined cygwin call %SCRIPT_PATH%\batfile\cygwin.bat

if defined cmder call %SCRIPT_PATH%\batfile\cmder.bat

if defined python call %SCRIPT_PATH%\batfile\python.bat

if defined mobaxterm call %SCRIPT_PATH%\batfile\mobaxterm.bat

if defined install_adbputty call %SCRIPT_PATH%\batfile\adbputty.bat

if defined install_notepadpp call %SCRIPT_PATH%\batfile\notepadpp.bat

if defined sublime call %SCRIPT_PATH%\batfile\sublime.bat

if defined hfs call %SCRIPT_PATH%\batfile\hfs.bat

if defined everything call %SCRIPT_PATH%\batfile\everything.bat

if defined listary call %SCRIPT_PATH%\batfile\listary.bat

if defined markdownpad call %SCRIPT_PATH%\batfile\markdownpad.bat

if defined fastcopy call %SCRIPT_PATH%\batfile\fastcopy.bat

if defined vbs2exe call %SCRIPT_PATH%\batfile\vbs2exe.bat

if defined bat2exe call %SCRIPT_PATH%\batfile\bat2exe.bat

if not defined clean goto END
echo Now We need to clean & reboot
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /dist"
%CYGWIN_ROOT%\bin\bash -i -c "sleep 3"
%CYGWIN_ROOT%\bin\bash -i -c "reboot"

:END
pause