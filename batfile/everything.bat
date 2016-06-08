set EVERYTHING_ROOT=%WINIXROOT%\Everything
set EVERYTHING_ZIP=%SCRIPT_PATH%\dist\Everything-1.3.4.686.x86.Multilingual.zip

mkdir %EVERYTHING_ROOT%
"%UNZIPPER%" -o "%EVERYTHING_ZIP%" -d "%EVERYTHING_ROOT%"
copy %CYGWIN_ROOT%\xcfg\windows\Everything.ini %EVERYTHING_ROOT%\
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Everything" /t REG_SZ /d "\"%EVERYTHING_ROOT%\Everything.exe\" -startup" /f >nul
