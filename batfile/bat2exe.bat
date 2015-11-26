set BAT2EXE_ROOT=%WINIXROOT%\Bat2Exe
set BAT2EXE_ZIP=%SCRIPT_PATH%\dist\Bat_To_Exe_Converter.zip

mkdir %BAT2EXE_ROOT%
"%UNZIPPER%" -o "%BAT2EXE_ZIP%" -d "%BAT2EXE_ROOT%"