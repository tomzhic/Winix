set CMDER_ROOT=%WINIXROOT%\Cmder
set CMDER_ZIP=%SCRIPT_PATH%\dist\cmder_mini.zip

mkdir %CMDER_ROOT%
"%UNZIPPER%" -o "%CMDER_ZIP%" -d "%CMDER_ROOT%"
copy %CYGWIN_ROOT%\xcfg\windows\Cmder.init.bat %CMDER_ROOT%\
copy %CYGWIN_ROOT%\xcfg\windows\Cmder.aliases.rc %CMDER_ROOT%\
copy %CYGWIN_ROOT%\xcfg\windows\ConEmu.xml %CMDER_ROOT%\config\
copy %CYGWIN_ROOT%\xcfg\windows\cmder.lua %CMDER_ROOT%\config\

reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Cmder" /ve /t REG_SZ /d "Cmder" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\Cmder\Command" /ve /t REG_SZ /d "\"%CMDER_ROOT%\Cmder.exe\" \"%%V\"" /f >nul
