set XLaunchPad_ROOT=%WINIXROOT%\XLaunchPad
set XLaunchPad_ZIP=%SCRIPT_PATH%\dist\XLaunchPad.zip

mkdir %XLaunchPad_ROOT%
"%UNZIPPER%" -o "%XLaunchPad_ZIP%" -d "%XLaunchPad_ROOT%"

copy %CYGWIN_ROOT%\xcfg\windows\XLaunchPad.items.xml %XLaunchPad_ROOT%\AppData\Shortcuts\items.xml
copy %CYGWIN_ROOT%\xcfg\windows\XLaunchPad.Settings.ini %XLaunchPad_ROOT%\AppData\Settings.ini
xcopy %SCRIPT_PATH%\icon %XLaunchPad_ROOT%\AppData\Shortcuts\Icons\Winix /e /y /c /i

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "XLaunchpad" /t REG_SZ /d "%WINIXROOT%\XLaunchPad\XLaunchpad.exe" /f >nul
