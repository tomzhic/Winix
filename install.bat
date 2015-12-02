@echo on

rem if you do want to install any package, just rem it, like

::do not install win32 python by default 
::set python=1

set cygwin=1
set cmder=1
set mobaxterm=1
set adbputty=1
set notepadpp=1
set sublime=1
set hfs=1
set everything==1
set listary==1
set markdownpad==1
set pspad=1
set fastcopy==1
set vbs2exe=1
set bat2exe=1
set gitcam=1
set becyicongrabber=1
set teraterm=1
set picpick=1
set foobar2000=1
set vlc=1
set smplayer=1
set sumatrapdf=1
set filezilla=1
set linuxreader=1
set xlaunchpad=1
set ccleaner=1
set rocketdock=1
set 7zip=1
set xnview=1
set diskgenius=1
set filetypesman=1
set produkey=1
set speccy=1
set dexpot=1
set aeroenabler=1
set systemfontsreplacer=1
set fossamail=1
set winscp=1
set pinghurry=1
set kitty=1

set clean=1

set WINIXROOT=D:\MyWinix

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

if defined adbputty call %SCRIPT_PATH%\batfile\adbputty.bat

if defined notepadpp call %SCRIPT_PATH%\batfile\notepadpp.bat

if defined sublime call %SCRIPT_PATH%\batfile\sublime.bat

if defined hfs call %SCRIPT_PATH%\batfile\hfs.bat

if defined everything call %SCRIPT_PATH%\batfile\everything.bat

if defined listary call %SCRIPT_PATH%\batfile\listary.bat

if defined markdownpad call %SCRIPT_PATH%\batfile\markdownpad.bat

if defined pspad call %SCRIPT_PATH%\batfile\pspad.bat

if defined fastcopy call %SCRIPT_PATH%\batfile\fastcopy.bat

if defined vbs2exe call %SCRIPT_PATH%\batfile\vbs2exe.bat

if defined bat2exe call %SCRIPT_PATH%\batfile\bat2exe.bat

if defined gitcam call %SCRIPT_PATH%\batfile\gifcam.bat

if defined becyicongrabber call %SCRIPT_PATH%\batfile\becyicongrabber.bat

if defined teraterm call %SCRIPT_PATH%\batfile\teraterm.bat

if defined picpick call %SCRIPT_PATH%\batfile\picpick.bat

if defined foobar2000 call %SCRIPT_PATH%\batfile\foobar2000.bat

if defined vlc call %SCRIPT_PATH%\batfile\vlc.bat

if defined smplayer call %SCRIPT_PATH%\batfile\smplayer.bat

if defined sumatrapdf call %SCRIPT_PATH%\batfile\sumatrapdf.bat

if defined filezilla call %SCRIPT_PATH%\batfile\filezilla.bat

if defined linuxreader call %SCRIPT_PATH%\batfile\linuxreader.bat

if defined xlaunchpad call %SCRIPT_PATH%\batfile\xlaunchpad.bat

if defined ccleaner call %SCRIPT_PATH%\batfile\ccleaner.bat

if defined rocketdock call %SCRIPT_PATH%\batfile\rocketdock.bat

if defined 7zip call %SCRIPT_PATH%\batfile\7zip.bat

if defined xnview call %SCRIPT_PATH%\batfile\xnview.bat

if defined diskgenius call %SCRIPT_PATH%\batfile\diskgenius.bat

if defined filetypesman call %SCRIPT_PATH%\batfile\filetypesman.bat

if defined produkey call %SCRIPT_PATH%\batfile\produkey.bat

if defined speccy call %SCRIPT_PATH%\batfile\speccy.bat

if defined dexpot call %SCRIPT_PATH%\batfile\dexpot.bat

if defined aeroenabler call %SCRIPT_PATH%\batfile\aeroenabler.bat

if defined systemfontsreplacer call %SCRIPT_PATH%\batfile\systemfontsreplacer.bat

if defined fossamail call %SCRIPT_PATH%\batfile\fossamail.bat

if defined winscp call %SCRIPT_PATH%\batfile\winscp.bat

if defined pinghurry call %SCRIPT_PATH%\batfile\pinghurry.bat

if defined kitty call %SCRIPT_PATH%\batfile\kitty.bat

if not defined clean goto END
echo Now We need to clean & reboot
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /dist"
%CYGWIN_ROOT%\bin\bash -i -c "sleep 3"
%CYGWIN_ROOT%\bin\bash -i -c "reboot"

:END
pause