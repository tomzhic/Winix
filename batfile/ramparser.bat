set ramparser_ROOT=%WINIXROOT%\Android\ramparser
set ramparser_ZIP=%SCRIPT_PATH%\dist\ramparser.zip

mkdir %ramparser_ROOT%
"%UNZIPPER%" -o "%ramparser_ZIP%" -d "%ramparser_ROOT%"