set AeroEnabler_ROOT=%WINIXROOT%\AeroEnabler
set AeroEnabler_ZIP=%SCRIPT_PATH%\dist\AeroEnabler.zip

mkdir %AeroEnabler_ROOT%
"%UNZIPPER%" -o "%AeroEnabler_ZIP%" -d "%AeroEnabler_ROOT%"