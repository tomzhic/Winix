set FileTypesMan_ROOT=%WINIXROOT%\FileTypesMan
set FileTypesMan_ZIP=%SCRIPT_PATH%\dist\filetypesman.zip

mkdir %FileTypesMan_ROOT%
"%UNZIPPER%" -o "%FileTypesMan_ZIP%" -d "%FileTypesMan_ROOT%"