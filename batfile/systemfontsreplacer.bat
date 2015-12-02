set SystemFontsReplacer_ROOT=%WINIXROOT%\SystemFontsReplacer
set SystemFontsReplacer_ZIP=%SCRIPT_PATH%\dist\SystemFontsReplacer.zip

mkdir %SystemFontsReplacer_ROOT%
"%UNZIPPER%" -o "%SystemFontsReplacer_ZIP%" -d "%SystemFontsReplacer_ROOT%"