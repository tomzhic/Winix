set Sysinternals_ROOT=%WINIXROOT%\Sysinternals
set Sysinternals_ZIP=%SCRIPT_PATH%\dist\SysinternalsSuite.zip

mkdir %Sysinternals_ROOT%
"%UNZIPPER%" -o "%Sysinternals_ZIP%" -d "%Sysinternals_ROOT%"