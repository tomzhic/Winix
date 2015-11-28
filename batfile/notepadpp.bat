set NOTEPADPP_ROOT=%WINIXROOT%\Notepad++
set NOTEPADPP_ZIP=%SCRIPT_PATH%\dist\npp.6.8.6.bin.zip

mkdir %NOTEPADPP_ROOT%
"%UNZIPPER%" -o "%NOTEPADPP_ZIP%" -d "%NOTEPADPP_ROOT%"
copy %CYGWIN_ROOT%\xcfg\Notepad++.config.xml %NOTEPADPP_ROOT%\config.xml /y
copy %CYGWIN_ROOT%\xcfg\Notepad++.stylers.xml %NOTEPADPP_ROOT%\stylers.xml /y
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++" /ve /t REG_SZ /d "Edit with Notepad++" /f >nul
reg add "HKEY_CLASSES_ROOT\*\shell\Notepad++\Command" /ve /t REG_SZ /d "\"%NOTEPADPP_ROOT%\notepad++.exe\" \"%%1\"" /f >nul