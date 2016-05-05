set Lantern_ROOT=%WINIXROOT%\Lantern
set Lantern_ZIP=%SCRIPT_PATH%\dist\lantern-installer.zip

mkdir %Lantern_ROOT%
"%UNZIPPER%" -o "%Lantern_ZIP%" -d "%Lantern_ROOT%"