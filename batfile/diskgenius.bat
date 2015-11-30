set DiskGenius_ROOT=%WINIXROOT%\DiskGenius
set DiskGenius_ZIP=%SCRIPT_PATH%\dist\DiskGenius.zip

mkdir %DiskGenius_ROOT%
"%UNZIPPER%" -o "%DiskGenius_ZIP%" -d "%DiskGenius_ROOT%"