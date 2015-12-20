set Meld_ROOT=%WINIXROOT%\Meld
set Meld_ZIP=%SCRIPT_PATH%\dist\Meld.zip

mkdir %Meld_ROOT%
"%UNZIPPER%" -o "%Meld_ZIP%" -d "%Meld_ROOT%"