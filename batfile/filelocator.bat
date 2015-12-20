set FileLocator_ROOT=%WINIXROOT%\FileLocator
set FileLocator_ZIP=%SCRIPT_PATH%\dist\FileLocator.zip

mkdir %FileLocator_ROOT%
"%UNZIPPER%" -o "%FileLocator_ZIP%" -d "%FileLocator_ROOT%"