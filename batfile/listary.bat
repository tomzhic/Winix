set LISTARY_ROOT=%WINIXROOT%\Listary
set LISTARY_ZIP=%SCRIPT_PATH%\dist\ListaryPortable.zip

mkdir %LISTARY_ROOT%
mkdir %LISTARY_ROOT%\UserData
"%UNZIPPER%" -o "%LISTARY_ZIP%" -d "%LISTARY_ROOT%"
xcopy %LISTARY_ROOT%\ListaryPortable %LISTARY_ROOT% /E /Y
rd /s /q %LISTARY_ROOT%\ListaryPortable
copy %CYGWIN_ROOT%\xcfg\Listary.Preferences.json %LISTARY_ROOT%\UserData\Preferences.json
schtasks /delete /tn Listary /f
schtasks /create /tn Listary /tr %LISTARY_ROOT%\Listary.exe  /sc ONLOGON