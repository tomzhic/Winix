set Zip_ROOT=%WINIXROOT%\7-Zip
set Zip_ZIP=%SCRIPT_PATH%\dist\7z1602.zip

mkdir %Zip_ROOT%
"%UNZIPPER%" -o "%Zip_ZIP%" -d "%Zip_ROOT%"