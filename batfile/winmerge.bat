set WinMerge_ROOT=%WINIXROOT%\WinMerge
set WinMerge_ZIP=%SCRIPT_PATH%\dist\WinMerge-2.14.0-exe.zip

mkdir %WinMerge_ROOT%
"%UNZIPPER%" -o "%WinMerge_ZIP%" -d "%WinMerge_ROOT%"


xcopy %WinMerge_ROOT%\WinMerge-2.14.0-exe %WinMerge_ROOT% /e /y /c
rd /s /q %WinMerge_ROOT%\WinMerge-2.14.0-exe