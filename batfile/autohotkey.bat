set AutoHotkeyROOT=%WINIXROOT%\AutoHotkey
set AutoHotkey_ZIP=%SCRIPT_PATH%\dist\AutoHotkey112209_x64.zip

mkdir %AutoHotkeyROOT%
"%UNZIPPER%" -o "%AutoHotkey_ZIP%" -d "%AutoHotkeyROOT%"