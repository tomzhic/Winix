set ProduKey_ROOT=%WINIXROOT%\ProduKey
set ProduKey_ZIP=%SCRIPT_PATH%\dist\produkey-x64.zip

mkdir %ProduKey_ROOT%
"%UNZIPPER%" -o "%ProduKey_ZIP%" -d "%ProduKey_ROOT%"