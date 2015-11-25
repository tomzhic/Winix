set SUBLIME_ROOT=%WINIXROOT%\Sublime
set SUBLIME_ZIP=%SCRIPT_PATH%\dist\Sublime Text 2.0.2 x64.zip

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