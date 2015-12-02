set PingHurry_ROOT=%WINIXROOT%\PingHurry
set PingHurry_ZIP=%SCRIPT_PATH%\dist\PingHurryPortable_1.1.zip

mkdir %PingHurry_ROOT%
"%UNZIPPER%" -o "%PingHurry_ZIP%" -d "%PingHurry_ROOT%"