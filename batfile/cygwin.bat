set CYGWIN_ROOT=%WINIXROOT%\Cygwin
set CYGWIN_SETUP=%SCRIPT_PATH%\dist\setup-x86_64.exe
set CYGWIN_MIRROR=http://mirrors.163.com/cygwin

%CYGWIN_SETUP% -q -g -n -s "%CYGWIN_MIRROR%" -R "%CYGWIN_ROOT%" -l "%CYGWIN_ROOT%\dist" ^
-P git -P wget -P curl -P vim -P zsh -P gitk -P shutdown -P xorg-server -P oxygen-fonts ^
-P dos2unix -P procps -P psmisc -P patch -P sqlite3 -P tmux -P tree -P iperf -P cpio -P texinfo ^
-P automake -P autoconf -P bison -P flex -P cmake -P gcc-core -P gcc-g++ -P m4

rem oh-my-zsh
%CYGWIN_ROOT%\bin\bash -l -c "wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh"

rem vimrc
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/amix/vimrc.git ~/.vim_runtime"
%CYGWIN_ROOT%\bin\bash -l -c "sh ~/.vim_runtime/install_awesome_vimrc.sh"

rem oh-my-config
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/oh-my-config.git /xcfg"
%CYGWIN_ROOT%\bin\bash -l -c "\\cp /xcfg/cygwin/.* ~/ > /dev/null 2>&1"
%CYGWIN_ROOT%\bin\bash -l -c "\\cp -rf /xcfg/cygwin/.config/ ~/ > /dev/null 2>&1"
%CYGWIN_ROOT%\bin\bash -l -c "\\cp -rf /xcfg/cygwin/Cygwin.etc.fstab /etc/fstab > /dev/null 2>&1"

rem hello-cygwin
%CYGWIN_ROOT%\bin\bash -l -c "git clone https://github.com/kiddlu/oh-my-tools.git /xbin"
%CYGWIN_ROOT%\bin\bash -l -c "chmod +x /xbin/* 1> /dev/null 2> /dev/null"

%CYGWIN_ROOT%\bin\bash -l -c "ln -s %WINIXROOT% /winix"

rem assoc
assoc .sh=Shell.File
ftype Shell.File="%CYGWIN_ROOT%\bin\bash.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Shell.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

assoc .py=Python.File
ftype Python.File="%CYGWIN_ROOT%\bin\python2.7.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Python.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

assoc .pl=Perl.File
ftype Perl.File="%CYGWIN_ROOT%\bin\perl.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Perl.File\DefaultIcon" /ve /t REG_SZ /d "%CYGWIN_ROOT%\Cygwin-Terminal.ico,0" /f >nul

rem wget setup-x86_64.exe
copy %CYGWIN_SETUP% %CYGWIN_ROOT%\
