@echo off
echo Please Wait...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    
    echo You need to run this script as an administrator.
    echo Please right-click on the script and select "Run as administrator".
    pause
    exit /b
)
setlocal

set "BaseDir=%~dp0"
mkdir %BaseDir%World
set "ImageFile=%BaseDir%Image\Centown.swm"
set "SWMFile=%BaseDir%Image\Centown*.swm"
set "ApplyDir=%BaseDir%World"
Dism /Apply-Image /ImageFile:"%ImageFile%" /SWMFile:"%SWMFile%" /Index:1 /ApplyDir:"%ApplyDir%" /CheckIntegrity /Verify
if '%errorlevel%' == '0' (
    


)
else (

)
    pause
    exit /b
