set PYTHON_ROOT=%WINIXROOT%\Python
set PYTHON_MSI=%SCRIPT_PATH%\dist\python-2.7.10.amd64.msi

msiexec /x %PYTHON_MSI% /quiet /passive /norestart
msiexec /i %PYTHON_MSI% TARGETDIR="%PYTHON_ROOT%" /quiet /passive /norestart

assoc .py=Python.File
ftype Python.File="%PYTHON_ROOT%\python.exe" "%%1" %%*
reg add "HKEY_CLASSES_ROOT\Python.File\DefaultIcon" /ve /t REG_SZ /d "%PYTHON_ROOT%\DLLs\py.ico" /f >nul