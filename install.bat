@echo on

set install_cygwin=yes
set install_cmder=yes
set install_python_win32=yes
set install_mobaxterm=yes
set install_adbputty=yes
set install_sublime_text=yes
set install_notepadpp=yes
set do_final_job=yes

set SCRIPT_PATH=%~dp0
set UNZIPPER=%SCRIPT_PATH%\tools\unzip.exe
set CMDER_ZIP=%SCRIPT_PATH%\dist\cmder_mini.zip
set CYGWIN_SETUP=%SCRIPT_PATH%\dist\setup-x86_64.exe
set CYGWIN_MIRROR=http://mirrors.163.com/cygwin
set PYTHON_MSI=%SCRIPT_PATH%\dist\python-2.7.10.amd64.msi
set MOBAXTERM_EXE=%SCRIPT_PATH%\dist\MobaXterm.exe
set ADBPUTTY_ZIP=%SCRIPT_PATH%\dist\adbputty.zip
set SUBLIME_ZIP=%SCRIPT_PATH%\dist\Sublime Text 2.0.2 x64.zip

set WINIX_ROOT=D:\Winix
set CYGWIN_ROOT=%WINIX_ROOT%\Cygwin
set CMDER_ROOT=%WINIX_ROOT%\Cmder
set PYTHON_ROOT=%WINIX_ROOT%\Python
set MOBAXTERM_ROOT=%WINIX_ROOT%\MobaXterm
set ADBPUTTY_ROOT=%WINIX_ROOT%\Android\adbputty
set SUBLIME_ROOT=%WINIX_ROOT%\Sublime

rem set WINIX_ROOT to env
wmic ENVIRONMENT where "name='WINIX_ROOT'" delete
wmic ENVIRONMENT create name="WINIX_ROOT",username="<system>",VariableValue="%WINIX_ROOT%"

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
if not %install_adbputty%==yes goto SUBLIME
mkdir %ADBPUTTY_ROOT%
"%UNZIPPER%" -o "%ADBPUTTY_ZIP%" -d "%ADBPUTTY_ROOT%"

:SUBLIME
if not %install_sublime_text%==yes goto FINAL
mkdir %SUBLIME_ROOT%
"%UNZIPPER%" -o "%SUBLIME_ZIP%" -d "%SUBLIME_ROOT%"

%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/hello-sublime.git /mysublime"
xcopy %CYGWIN_ROOT%\mysublime\Data %SUBLIME_ROOT%\Data /E /Y
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /mysublime"

reg add "HKEY_CLASSES_ROOT\*\shell\SubLime" /ve /t REG_SZ /d "Edit with Sublime Text" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\SubLime\Command" /ve /t REG_SZ /d "\"%SUBLIME_ROOT%\sublime_text.exe\" \"%%1\"" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\SubLime" /ve /t REG_SZ /d "Edit with Sublime Text" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\shell\SubLime\Command" /ve /t REG_SZ /d "\"%SUBLIME_ROOT%\sublime_text.exe\" \"%%1\"" /f >nul

:FINAL
if not %do_final_job%==yes goto END

echo Now We need to clean & reboot
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "rm -rf /dist"
%CYGWIN_ROOT%\bin\bash -i -c "sleep 3"
%CYGWIN_ROOT%\bin\bash -i -c "reboot"

:END
pause
