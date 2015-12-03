set MacType_ROOT=%WINIXROOT%\MacType
set MacType_ZIP=%SCRIPT_PATH%\dist\MacType.zip

mkdir %MacType_ROOT%
"%UNZIPPER%" -o "%MacType_ZIP%" -d "%MacType_ROOT%"
copy %CYGWIN_ROOT%\xcfg\MacType.ini %MacType_ROOT%\MacType.ini /y
copy %CYGWIN_ROOT%\xcfg\MacType.Winix.ini %MacType_ROOT%\ini\Winix.ini