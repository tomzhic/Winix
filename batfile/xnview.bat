set XvView_ROOT=%WINIXROOT%\XnView
set XvView_ZIP=%SCRIPT_PATH%\dist\XnView-win-full.zip

mkdir %XvView_ROOT%
"%UNZIPPER%" -o "%XvView_ZIP%" -d "%XvView_ROOT%"


xcopy %XvView_ROOT%\XnView %XvView_ROOT% /e /y /c
rd /s /q %XvView_ROOT%\XnView