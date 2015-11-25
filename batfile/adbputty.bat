set ADBPUTTY_ROOT=%WINIXROOT%\Android\adbputty
set ADBPUTTY_ZIP=%SCRIPT_PATH%\dist\adbputty.zip

mkdir %ADBPUTTY_ROOT%
"%UNZIPPER%" -o "%ADBPUTTY_ZIP%" -d "%ADBPUTTY_ROOT%"