set FossaMail_ROOT=%WINIXROOT%\FossaMail
set FossaMail_ZIP=%SCRIPT_PATH%\dist\FossaMail-25.1.9.win64.installer.zip
set FossaMail_LOCALE_CN=%SCRIPT_PATH%\dist\FossaMail-25.1.zh-CN.zip

mkdir %FossaMail_ROOT%
"%UNZIPPER%" -o "%FossaMail_ZIP%" -d "%FossaMail_ROOT%"
"%UNZIPPER%" -o "%FossaMail_LOCALE_CN%" -d "%FossaMail_ROOT%"