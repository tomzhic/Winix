set PSPAD_ROOT=%WINIXROOT%\PSPad
set PSPAD_ZIP=%SCRIPT_PATH%\dist\pspad460en.zip

mkdir %PSPAD_ROOT%
"%UNZIPPER%" -o "%PSPAD_ZIP%" -d "%PSPAD_ROOT%"