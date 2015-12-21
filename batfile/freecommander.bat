set FreeCommander_ROOT=%WINIXROOT%\FreeCommander
set FreeCommander_ZIP=%SCRIPT_PATH%\dist\FreeCommanderXE-32-public_beta_portable700.zip

mkdir %FreeCommander_ROOT%
"%UNZIPPER%" -o "%FreeCommander_ZIP%" -d "%FreeCommander_ROOT%"

mkdir %FreeCommander_ROOT%\SETTINGS
copy %CYGWIN_ROOT%\xcfg\FreeCommander.fav.ini %FreeCommander_ROOT%\SETTINGS\FreeCommander.fav.ini
copy %CYGWIN_ROOT%\xcfg\FreeCommander.ini %FreeCommander_ROOT%\SETTINGS\FreeCommander.ini
copy %CYGWIN_ROOT%\xcfg\FreeCommander.shc %FreeCommander_ROOT%\SETTINGS\FreeCommander.shc


reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\FreeCommander" /ve /t REG_SZ /d "FreeCommander" /f >nul
reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\FreeCommander\Command" /ve /t REG_SZ /d "\"%FreeCommander_ROOT%\FreeCommander.exe\" /T \"%%V\"" /f >nul