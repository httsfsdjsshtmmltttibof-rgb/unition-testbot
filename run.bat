@echo off
title UNATION English Level Check Server
echo ===================================================
echo   UNATION ENGLISH SCHOOL - PLACEMENT TEST PLATFORM
echo ===================================================
echo.
echo Starting Backend and Frontend Servers...
echo.

start "UNATION Backend (Port 3001)" cmd /k "cd /d "%~dp0backend" && npm run dev"
timeout /t 3 /nobreak >nul
start "UNATION Frontend (Port 5173)" cmd /k "cd /d "%~dp0frontend" && npx vite --host"

echo.
echo ===================================================
echo [OK] Both servers are starting!
echo.
echo Student Test URL:  http://localhost:5173
echo Admin Dashboard:   http://localhost:5173/admin
echo.
echo Keep this terminal or the opened server windows open.
echo ===================================================
timeout /t 2 /nobreak >nul
start http://localhost:5173
