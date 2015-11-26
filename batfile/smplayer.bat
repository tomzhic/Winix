set SMPLATER_ROOT=%WINIXROOT%\SMPlayer
set SMPLATER_ZIP=%SCRIPT_PATH%\dist\smplayer-portable-15.9.0.0-x64.zip

mkdir %SMPLATER_ROOT%
"%UNZIPPER%" -o "%SMPLATER_ZIP%" -d "%SMPLATER_ROOT%"