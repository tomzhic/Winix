set youget_ROOT=%WINIXROOT%\You-get
set youget_ZIP=%SCRIPT_PATH%\dist\you-get.zip

mkdir %youget_ROOT%
"%UNZIPPER%" -o "%youget_ZIP%" -d "%youget_ROOT%"