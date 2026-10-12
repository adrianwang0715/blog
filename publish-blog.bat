@echo off
rem ===================================================
rem  Publish your blog to the internet
rem
rem  Double-click this file AFTER you have added or
rem  edited an article in src\content\posts\
rem
rem  It will:  save -> upload to GitHub -> Cloudflare
rem            rebuilds the live site automatically
rem ===================================================
cd /d "%~dp0"

set "GIT=C:\Program Files\Git\cmd\git.exe"

echo ===================================================
echo  Publishing to GitHub...
echo ===================================================
echo.

"%GIT%" add -A
if errorlevel 1 goto failed

rem --- if nothing changed, stop early instead of making an empty commit
"%GIT%" diff --cached --quiet
if not errorlevel 1 (
    echo No changes found. Nothing to publish.
    echo.
    pause
    exit /b 0
)

"%GIT%" commit -m "publish: update blog %date% %time%"
if errorlevel 1 goto failed

"%GIT%" push
if errorlevel 1 goto failed

echo.
echo ===================================================
echo  DONE! Cloudflare is rebuilding your site now.
echo  Wait 1-2 minutes, then open:
echo.
echo    https://firefly.adrianwang0715.workers.dev
echo ===================================================
echo.
pause
exit /b 0

:failed
echo.
echo ===================================================
echo  FAILED.
echo  Take a screenshot of THIS window and send it
echo  to me so I can see what went wrong.
echo ===================================================
echo.
pause
exit /b 1
