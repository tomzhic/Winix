set Ditto_ROOT=%WINIXROOT%\Ditto
set Ditto_ZIP=%SCRIPT_PATH%\dist\DittoPortable_3_21_50_0.zip

mkdir %Ditto_ROOT%
"%UNZIPPER%" -o "%Ditto_ZIP%" -d "%Ditto_ROOT%"

xcopy %Ditto_ROOT%\Ditto %Ditto_ROOT% /e /y /c
rd /s /q %Ditto_ROOT%\Ditto

copy %CYGWIN_ROOT%\xcfg\windows\Ditto.Settings %Ditto_ROOT%\Ditto.Settings
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Ditto" /t REG_SZ /d "%WINIXROOT%\Ditto\Ditto.exe" /f >nul
