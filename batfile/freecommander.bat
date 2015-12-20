set FreeCommander_ROOT=%WINIXROOT%\FreeCommander
set FreeCommander_ZIP=%SCRIPT_PATH%\dist\FreeCommanderXE-32-public_beta_portable700.zip

mkdir %FreeCommander_ROOT%
"%UNZIPPER%" -o "%FreeCommander_ZIP%" -d "%FreeCommander_ROOT%"

mkdir %FreeCommander_ROOT%\SETTINGS
copy %CYGWIN_ROOT%\xcfg\FreeCommander.fav.ini %FreeCommander_ROOT%\SETTINGS\FreeCommander.fav.ini
copy %CYGWIN_ROOT%\xcfg\FreeCommander.ini %FreeCommander_ROOT%\SETTINGS\FreeCommander.ini
copy %CYGWIN_ROOT%\xcfg\FreeCommander.shc %FreeCommander_ROOT%\SETTINGS\FreeCommander.shc