set Ditto_ROOT=%WINIXROOT%\Ditto
set Ditto_ZIP=%SCRIPT_PATH%\dist\DittoPortable_64bit_3_21_30_0.zip

mkdir %Ditto_ROOT%
"%UNZIPPER%" -o "%Ditto_ZIP%" -d "%Ditto_ROOT%"

xcopy %Ditto_ROOT%\Ditto %Ditto_ROOT% /e /y /c
rd /s /q %Ditto_ROOT%\Ditto