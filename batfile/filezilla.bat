set FileZilla_ROOT=%WINIXROOT%\FileZilla
set FileZilla_ZIP=%SCRIPT_PATH%\dist\FileZilla_3.14.1_win64.zip

mkdir %FileZilla_ROOT%
"%UNZIPPER%" -o "%FileZilla_ZIP%" -d "%FileZilla_ROOT%"

xcopy %FileZilla_ROOT%\FileZilla-3.14.1 %FileZilla_ROOT% /e /y /c
rd /s /q %FileZilla_ROOT%\FileZilla-3.14.1