set MOBAXTERM_ROOT=%WINIXROOT%\MobaXterm
set MOBAXTERM_ZIP=%SCRIPT_PATH%\dist\MobaXterm_v8.6.zip

mkdir %MOBAXTERM_ROOT%
"%UNZIPPER%" -o "%MOBAXTERM_ZIP%" -d "%MOBAXTERM_ROOT%"
copy %CYGWIN_ROOT%\xcfg\windows\MobaXterm.ini %MOBAXTERM_ROOT%\
