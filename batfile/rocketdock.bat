set RocketDock_ROOT=%WINIXROOT%\RocketDock
set RocketDock_ZIP=%SCRIPT_PATH%\dist\RocketDock.zip

mkdir %RocketDock_ROOT%
"%UNZIPPER%" -o "%RocketDock_ZIP%" -d "%RocketDock_ROOT%"

copy %CYGWIN_ROOT%\xcfg\windows\RocketDock.Settings.ini %RocketDock_ROOT%\Settings.ini
xcopy %SCRIPT_PATH%\icon %RocketDock_ROOT%\Icons\Winix /e /y /c /i

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "RocketDock" /t REG_SZ /d "\"%WINIXROOT%\RocketDock\RocketDock.exe\"" /f >nul
