set WinSCP_ROOT=%WINIXROOT%\WinSCP
set WinSCP_ZIP=%SCRIPT_PATH%\dist\winscp576.zip

mkdir %WinSCP_ROOT%
"%UNZIPPER%" -o "%WinSCP_ZIP%" -d "%WinSCP_ROOT%"