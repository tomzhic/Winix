@echo on
rem ===============================================================================

set SCRIPT_PATH=%~dp0
set KILL=%SCRIPT_PATH%\tools\nircmd.exe killprocess
set RM=%SCRIPT_PATH%\tools\busybox.exe rm -rf

%KILL% Everything.exe
%KILL% XLaunchPad.exe
%KILL% RocketDock.exe
%KILL% Listary.exe
%KILL% ListaryService.exe
%KILL% Ditto.exe
%RM% %WINIXROOT%

wmic ENVIRONMENT where "name='WINIXROOT'" delete

:END
pause