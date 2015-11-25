@echo on

rem if you do want to install any package, just rem it
::set install_cygwin=yes
::set install_cmder=yes
::set install_python_win32=yes
::set install_mobaxterm=yes
::set install_adbputty=yes
::set install_notepadpp=yes
::set install_sublime_text=yes
::set install_hfs=yes
::set install_everything==yes
::set install_listary==yes
::set install_markdownpad==yes
set do_final_job=1

set WINIXROOT=D:\Winix

set SCRIPT_PATH=%~dp0
set UNZIPPER=%SCRIPT_PATH%\tools\unzip.exe

set CYGWIN_ROOT=%WINIXROOT%\Cygwin

rem set WINIXROOT to env
wmic ENVIRONMENT where "name='WINIXROOT'" delete
wmic ENVIRONMENT create name="WINIXROOT",username="<system>",VariableValue="%WINIXROOT%"

if defined install_cygwin call %SCRIPT_PATH%\batfile\cygwin.bat

if defined install_cmder call %SCRIPT_PATH%\batfile\cmder.bat

if defined install_python_win32 call %SCRIPT_PATH%\batfile\python.bat

if defined install_mobaxterm call %SCRIPT_PATH%\batfile\mobaxterm.bat

if defined install_adbputty call %SCRIPT_PATH%\batfile\adbputty.bat

if defined install_notepadpp call %SCRIPT_PATH%\batfile\notepadpp.bat

if defined install_sublime_text call %SCRIPT_PATH%\batfile\sublime.bat

if defined install_hfs call %SCRIPT_PATH%\batfile\hfs.bat

if defined install_everything call %SCRIPT_PATH%\batfile\everything.bat

if defined install_listary call %SCRIPT_PATH%\batfile\listary.bat

if defined install_markdownpad call %SCRIPT_PATH%\batfile\markdownpad.bat


if not defined do_final_job goto END
echo Now We need to clean & reboot
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /dist"
%CYGWIN_ROOT%\bin\bash -i -c "sleep 3"
%CYGWIN_ROOT%\bin\bash -i -c "reboot"

pause