set VLC_ROOT=%WINIXROOT%\VLC
set VLC_ZIP=%SCRIPT_PATH%\dist\vlc-2.2.1-win64.zip

mkdir %VLC_ROOT%
"%UNZIPPER%" -o "%VLC_ZIP%" -d "%VLC_ROOT%"

xcopy %VLC_ROOT%\vlc-2.2.1 %VLC_ROOT% /e /y /c
rd /s /q %VLC_ROOT%\vlc-2.2.1