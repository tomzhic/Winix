set SpaceSniffer_ROOT=%WINIXROOT%\SpaceSniffer
set SpaceSniffer_ZIP=%SCRIPT_PATH%\dist\spacesniffer_1_2_0_2.zip

mkdir %SpaceSniffer_ROOT%
"%UNZIPPER%" -o "%SpaceSniffer_ZIP%" -d "%SpaceSniffer_ROOT%"