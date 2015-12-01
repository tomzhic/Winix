set Speccy_ROOT=%WINIXROOT%\Speccy
set Speccy_ZIP=%SCRIPT_PATH%\dist\spsetup128.zip

mkdir %Speccy_ROOT%
"%UNZIPPER%" -o "%Speccy_ZIP%" -d "%Speccy_ROOT%"