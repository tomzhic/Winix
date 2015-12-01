set Dexpot_ROOT=%WINIXROOT%\Dexpot
set Dexpot_ZIP=%SCRIPT_PATH%\dist\dexpot_1614_portable_r2439.zip

mkdir %Dexpot_ROOT%
"%UNZIPPER%" -o "%Dexpot_ZIP%" -d "%Dexpot_ROOT%"