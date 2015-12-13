set FreeCommander_ROOT=%WINIXROOT%\FreeCommander
set FreeCommander_ZIP=%SCRIPT_PATH%\dist\FreeCommanderXE-32-public_beta_portable700.zip

mkdir %FreeCommander_ROOT%
"%UNZIPPER%" -o "%FreeCommander_ZIP%" -d "%FreeCommander_ROOT%"