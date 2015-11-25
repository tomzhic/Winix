set MARKDOWNPAD_ROOT=%WINIXROOT%\MarkdownPad
set MARKDOWNPAD_ZIP=%SCRIPT_PATH%\dist\markdownpad2-portable.zip

mkdir %MARKDOWNPAD_ROOT%
"%UNZIPPER%" -o "%MARKDOWNPAD_ZIP%" -d "%MARKDOWNPAD_ROOT%"
xcopy %MARKDOWNPAD_ROOT%\markdownpad2-portable %MARKDOWNPAD_ROOT% /E /Y
rd /s /q %MARKDOWNPAD_ROOT%\markdownpad2-portable