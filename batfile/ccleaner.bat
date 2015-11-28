set CCleaner_ROOT=%WINIXROOT%\CCleaner
set CCleaner_ZIP=%SCRIPT_PATH%\dist\CCleaner.zip

mkdir %CCleaner_ROOT%
"%UNZIPPER%" -o "%CCleaner_ZIP%" -d "%CCleaner_ROOT%"