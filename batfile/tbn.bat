set TBN_ROOT=%WINIXROOT%\7plus-Taskbar-Numberer
set TBN_ZIP=%SCRIPT_PATH%\dist\7plus-Taskbar-Numberer.zip

mkdir %TBN_ROOT%
"%UNZIPPER%" -o "%TBN_ZIP%" -d "%TBN_ROOT%"