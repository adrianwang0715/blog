@echo off
rem ============================================
rem  Blog dev server launcher
rem  Double-click this file to start your blog.
rem  It works with or without VPN.
rem ============================================
cd /d "%~dp0"

rem make node visible to this window
set "PATH=C:\Users\22517\.workbuddy\binaries\node\versions\22.23.1;%PATH%"
set COREPACK_NPM_REGISTRY=https://registry.npmmirror.com

echo Starting blog dev server...
echo The browser will open http://127.0.0.1:4321/ in about 30 seconds.
echo.
echo To stop the server, close THIS window.
echo.

rem check whether the port is already taken by another running blog
netstat -ano | findstr ":4321" | findstr "LISTENING" >nul 2>&1
if not errorlevel 1 (
    echo ============================================
    echo  A blog server is ALREADY RUNNING on this computer.
    echo.
    echo  You cannot start a second copy.
    echo  Options:
    echo    1. Close the other black window, then run this again
    echo    2. Or just open http://127.0.0.1:4321/ in your browser
    echo ============================================
    echo.
    pause
    exit /b 1
)

rem open the browser after the server has had time to start
start "browser-launch" /min cmd /c "timeout /t 30 /nobreak >nul & start http://127.0.0.1:4321/"

rem run the dev server in THIS window (keeps console title non-empty,
rem which avoids a Node 22 bug: process_title assertion crash)
"C:\Users\22517\.workbuddy\binaries\node\versions\22.23.1\corepack.cmd" pnpm dev --host 127.0.0.1

echo.
echo ============================================
echo  Server stopped.
echo ============================================
echo.
pause
