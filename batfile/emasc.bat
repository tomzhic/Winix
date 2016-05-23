set Emacs_ROOT=%WINIXROOT%\Emacs
set Emacs_ZIP=%SCRIPT_PATH%\dist\emacs-24.5-bin-i686-mingw32.zip

mkdir %Emacs_ROOT%
"%UNZIPPER%" -o "%Emacs_ZIP%" -d "%Emacs_ROOT%"