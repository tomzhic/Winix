set FileZilla_ROOT=%WINIXROOT%\FileZilla
set FileZilla_ZIP=%SCRIPT_PATH%\dist\FileZilla_3.18.0_win32.zip

mkdir %FileZilla_ROOT%
"%UNZIPPER%" -o "%FileZilla_ZIP%" -d "%FileZilla_ROOT%"

xcopy %FileZilla_ROOT%\FileZilla-3.18.0 %FileZilla_ROOT% /e /y /c
rd /s /q %FileZilla_ROOT%\FileZilla-3.18.0