@echo on
rem ===============================================================================

set SCRIPT_PATH=%~dp0
set RM="%SCRIPT_PATH%\tools\busybox rm"

%RM% -rf %WINIXROOT%

wmic ENVIRONMENT where "name='WINIXROOT'" delete

:END
pause