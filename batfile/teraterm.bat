set TERATERM_ROOT=%WINIXROOT%\TeraTerm
set TERATERM_ZIP=%SCRIPT_PATH%\dist\teraterm-4.88.zip

mkdir %TERATERM_ROOT%
"%UNZIPPER%" -o "%TERATERM_ZIP%" -d "%TERATERM_ROOT%"

xcopy %TERATERM_ROOT%\teraterm-4.88 %TERATERM_ROOT% /e /y /c
rd /s /q %TERATERM_ROOT%\teraterm-4.88