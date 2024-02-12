@echo off
setlocal
echo Please Wait...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
color 4
echo =========================================================
echo You need to run this script as an administrator.
echo Please right-click on the script and select 'Run as administrator'.
pause
exit /b
)


set "BaseDir=%~dp0"
mkdir "%BaseDir%World" >nul
set "ImageFile=%BaseDir%Image\Centown.swm"
set "SWMFile=%BaseDir%Image\Centown*.swm"
set "ApplyDir=%BaseDir%World"
Dism /Apply-Image /ImageFile:"%ImageFile%" /SWMFile:"%SWMFile%" /Index:1 /ApplyDir:"%ApplyDir%" /CheckIntegrity /Verify
if '%errorlevel%' == '2' (
color 4
echo =========================================================
echo Do you forget to download the image files?
echo Please open the link in "Image/README.md" to download.
) else if '%errorlevel%' NEQ '0' (
color 4
echo =========================================================
echo Something went wrong.
echo Please check your image files.
) else (
color 2
cls
echo =========================================================
echo Success!
echo Centown save shall be in the 'World' folder.
)
pause
exit /b
