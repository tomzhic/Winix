set QWinFF_ROOT=%WINIXROOT%\QWinFF
set QWinFF_ZIP=%SCRIPT_PATH%\dist\QWinFF.zip

mkdir %QWinFF_ROOT%
"%UNZIPPER%" -o "%QWinFF_ZIP%" -d "%QWinFF_ROOT%"