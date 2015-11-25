@echo on

set install_cygwin=yes
set install_cmder=yes
set install_python_win32=yes
set install_mobaxterm=yes
set install_adbputty=yes
set install_notepadpp=yes
set install_sublime_text=yes
set install_hfs=yes
set install_everything==yes
set install_listary==yes
set install_markdownpad==yes
set do_final_job=yes

set WINIXROOT=D:\Winix
set CYGWIN_ROOT=%WINIXROOT%\Cygwin
set CMDER_ROOT=%WINIXROOT%\Cmder
set PYTHON_ROOT=%WINIXROOT%\Python
set MOBAXTERM_ROOT=%WINIXROOT%\MobaXterm
set ADBPUTTY_ROOT=%WINIXROOT%\Android\adbputty
set NOTEPADPP_ROOT=%WINIXROOT%\Notepad++
set SUBLIME_ROOT=%WINIXROOT%\Sublime
set HFS_ROOT=%WINIXROOT%\Hfs
set EVERYTHING_ROOT=%WINIXROOT%\Everything
set LISTARY_ROOT=%WINIXROOT%\Listary
set MARKDOWNPAD_ROOT=%WINIXROOT%\MarkdownPad

set SCRIPT_PATH=%~dp0
set UNZIPPER=%SCRIPT_PATH%\tools\unzip.exe
set CMDER_ZIP=%SCRIPT_PATH%\dist\cmder_mini.zip
set CYGWIN_SETUP=%SCRIPT_PATH%\dist\setup-x86_64.exe
set CYGWIN_MIRROR=http://mirrors.163.com/cygwin
set PYTHON_MSI=%SCRIPT_PATH%\dist\python-2.7.10.amd64.msi
set MOBAXTERM_EXE=%SCRIPT_PATH%\dist\MobaXterm.exe
set ADBPUTTY_ZIP=%SCRIPT_PATH%\dist\adbputty.zip
set NOTEPADPP_ZIP=%SCRIPT_PATH%\dist\npp.6.8.6.bin.zip
set SUBLIME_ZIP=%SCRIPT_PATH%\dist\Sublime Text 2.0.2 x64.zip
set HFS_EXE=%SCRIPT_PATH%\dist\hfs.exe
set EVERYTHING_ZIP=%SCRIPT_PATH%\dist\Everything-1.3.4.686.x64.Multilingual.zip
set LISTARY_ZIP=%SCRIPT_PATH%\dist\ListaryPortable.zip
set MARKDOWNPAD_ZIP=%SCRIPT_PATH%\dist\markdownpad2-portable.zip

rem set WINIXROOT to env
wmic ENVIRONMENT where "name='WINIXROOT'" delete
wmic ENVIRONMENT create name="WINIXROOT",username="<system>",VariableValue="%WINIXROOT%"

:CYGWIN
if not %install_cygwin%==yes goto CMDER
%CYGWIN_SETUP% -q -g -s "%CYGWIN_MIRROR%" -R "%CYGWIN_ROOT%" -l "%CYGWIN_ROOT%\dist" ^
-P git -P wget -P curl -P vim -P zsh -P gitk -P shutdown -P xorg-server -P oxygen-fonts ^
-P dos2unix -P procps -P psmisc -P patch -P sqlite3 -P tmux -P tree -P iperf

rem oh-my-zsh
%CYGWIN_ROOT%\bin\bash -l -c "wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh"

rem vimrc
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/amix/vimrc.git ~/.vim_runtime"
%CYGWIN_ROOT%\bin\bash -l -c "sh ~/.vim_runtime/install_awesome_vimrc.sh"

rem oh-my-config
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/oh-my-config.git /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "\\cp /xcfg/.* ~/ > /dev/null 2>&1"
%CYGWIN_ROOT%\bin\bash -l -c "\\cp -rf /xcfg/.config/ ~/ > /dev/null 2>&1"

rem hello-cygwin
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/hello-cygwin.git /xbin"
%CYGWIN_ROOT%\bin\bash -l -c "chmod +x /xbin/* 1> /dev/null 2> /dev/null"

rem assoc
assoc .sh=Shell.File
ftype Shell.File="%CYGWIN_ROOT%\bin\bash.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Shell.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

rem wget setup-x86_64.exe
copy %CYGWIN_SETUP% %CYGWIN_ROOT%\

:CMDER
if not %install_cmder%==yes goto PYTHON
mkdir %CMDER_ROOT%
"%UNZIPPER%" -o "%CMDER_ZIP%" -d "%CMDER_ROOT%"
copy %CYGWIN_ROOT%\xcfg\Cmder.init.bat %CMDER_ROOT%\
copy %CYGWIN_ROOT%\xcfg\ConEmu.xml %CMDER_ROOT%\config\
copy %CYGWIN_ROOT%\xcfg\cmder.lua %CMDER_ROOT%\config\

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Cmder" /ve /t REG_SZ /d "Cmder" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Cmder\Command" /ve /t REG_SZ /d "\"%CMDER_ROOT%\Cmder.exe\" \"%%V\"" /f >nul

:PYTHON
if not %install_python_win32%==yes goto MOBAXTERM
msiexec /x %PYTHON_MSI% /quiet /passive /norestart
msiexec /i %PYTHON_MSI% TARGETDIR="%PYTHON_ROOT%" /quiet /passive /norestart

assoc .py=Python.File
ftype Python.File="%PYTHON_ROOT%\python.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Python.File\DefaultIcon" /ve /t REG_SZ /d "%PYTHON_ROOT%\DLLs\py.ico" /f >nul

:MOBAXTERM
if not %install_mobaxterm%==yes goto ADBPUTTY
mkdir %MOBAXTERM_ROOT%
copy %MOBAXTERM_EXE% %MOBAXTERM_ROOT%\
copy %CYGWIN_ROOT%\xcfg\MobaXterm.ini %MOBAXTERM_ROOT%\

:ADBPUTTY
if not %install_adbputty%==yes goto NOTEPADPP
mkdir %ADBPUTTY_ROOT%
"%UNZIPPER%" -o "%ADBPUTTY_ZIP%" -d "%ADBPUTTY_ROOT%"

:NOTEPADPP
if not %install_notepadpp%==yes goto SUBLIME
mkdir %NOTEPADPP_ROOT%
"%UNZIPPER%" -o "%NOTEPADPP_ZIP%" -d "%NOTEPADPP_ROOT%"
xcopy %CYGWIN_ROOT%\xcfg\Notepad++.config.xml %NOTEPADPP_ROOT%\config.xml /y
xcopy %CYGWIN_ROOT%\xcfg\Notepad++.stylers.xml %NOTEPADPP_ROOT%\stylers.xml /y
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++" /ve /t REG_SZ /d "Edit with Notepad++" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++\Command" /ve /t REG_SZ /d "\"%NOTEPADPP_ROOT%\notepad++.exe\" \"%%1\"" /f >nul

:SUBLIME
if not %install_sublime_text%==yes goto HFS
mkdir %SUBLIME_ROOT%
"%UNZIPPER%" -o "%SUBLIME_ZIP%" -d "%SUBLIME_ROOT%"

%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/hello-sublime.git /mysublime"
xcopy %CYGWIN_ROOT%\mysublime\Data %SUBLIME_ROOT%\Data /E /Y
xcopy %CYGWIN_ROOT%\mysublime\Pristine Packages\Package Control.sublime-package %SUBLIME_ROOT%\Pristine Packages\ /E /Y
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /mysublime"

reg add "HKEY_CLASSES_ROOT\*\shell\SubLime" /ve /t REG_SZ /d "Edit with Sublime Text" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\SubLime\Command" /ve /t REG_SZ /d "\"%SUBLIME_ROOT%\sublime_text.exe\" \"%%1\"" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\SubLime" /ve /t REG_SZ /d "Edit with Sublime Text" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\SubLime\Command" /ve /t REG_SZ /d "\"%SUBLIME_ROOT%\sublime_text.exe\" \"%%1\"" /f >nul

:HFS
if not %install_hfs%==yes goto EVERYTHING
mkdir %HFS_ROOT%
copy %HFS_EXE% %HFS_ROOT%\

:EVERYTHING
if not %install_everything%==yes goto LISTARY
mkdir %EVERYTHING_ROOT%
"%UNZIPPER%" -o "%EVERYTHING_ZIP%" -d "%EVERYTHING_ROOT%"
copy %CYGWIN_ROOT%\xcfg\Everything.ini %EVERYTHING_ROOT%\
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Everything" /t REG_SZ /d "\"%EVERYTHING_ROOT%\Everything.exe\" -startup" /f >nul

:LISTARY
if not %install_listary%==yes goto MARKDOWNPAD
mkdir %LISTARY_ROOT%
mkdir %LISTARY_ROOT%\UserData
"%UNZIPPER%" -o "%LISTARY_ZIP%" -d "%LISTARY_ROOT%"
xcopy %LISTARY_ROOT%\ListaryPortable %LISTARY_ROOT% /E /Y
rd /s /q %LISTARY_ROOT%\ListaryPortable
copy %CYGWIN_ROOT%\xcfg\Listary.Preferences.json %LISTARY_ROOT%\UserData\Preferences.json
schtasks /delete /tn Listary /f
schtasks /create /tn Listary /tr %LISTARY_ROOT%\Listary.exe  /sc ONLOGON

:MARKDOWNPAD
if not %install_markdownpad%==yes goto FINAL
mkdir %MARKDOWNPAD_ROOT%
"%UNZIPPER%" -o "%MARKDOWNPAD_ZIP%" -d "%MARKDOWNPAD_ROOT%"
xcopy %MARKDOWNPAD_ROOT%\markdownpad2-portable %MARKDOWNPAD_ROOT% /E /Y
rd /s /q %MARKDOWNPAD_ROOT%\markdownpad2-portable

:FINAL
if not %do_final_job%==yes goto END

echo Now We need to clean & reboot
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /dist"
%CYGWIN_ROOT%\bin\bash -i -c "sleep 3"
%CYGWIN_ROOT%\bin\bash -i -c "reboot"

:END
pause