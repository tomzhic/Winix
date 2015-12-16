set LibreOffice_ROOT=%WINIXROOT%\LibreOffice
set LibreOffice_ZIP=%SCRIPT_PATH%\dist\LibreOffice.zip

mkdir %LibreOffice_ROOT%
"%UNZIPPER%" -o "%LibreOffice_ZIP%" -d "%LibreOffice_ROOT%"