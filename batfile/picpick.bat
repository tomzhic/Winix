set PICPICK_ROOT=%WINIXROOT%\PicPick
set PICPICK_ZIP=%SCRIPT_PATH%\dist\picpick_portable.zip

mkdir %PICPICK_ROOT%
"%UNZIPPER%" -o "%PICPICK_ZIP%" -d "%PICPICK_ROOT%"