set LinuxReader_ROOT=%WINIXROOT%\LinuxReader
set LinuxReader_ZIP=%SCRIPT_PATH%\dist\LinuxReader.zip

mkdir %LinuxReader_ROOT%
"%UNZIPPER%" -o "%LinuxReader_ZIP%" -d "%LinuxReader_ROOT%"