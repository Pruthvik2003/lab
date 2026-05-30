@echo off
REM YouTube Analytics Dashboard - Windows Startup Script
REM This script sets up and starts both the Flask backend and Next.js frontend

echo.
echo ============================================================
echo  YouTube Analytics Dashboard - Real-Time Edition
echo ============================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python from https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Check if Node is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo Detected Python: 
python --version

echo Detected Node.js: 
node --version

echo.
echo Step 1: Creating Python virtual environment...
if not exist "backend\venv" (
    python -m venv backend\venv
    echo Virtual environment created.
) else (
    echo Virtual environment already exists.
)

echo.
echo Step 2: Installing frontend dependencies...
if not exist "node_modules" (
    npm install
) else (
    echo Node modules already installed.
)

echo.
echo Step 3: Installing Python dependencies...
call backend\venv\Scripts\activate.bat
pip install -q -r backend\requirements.txt
echo Python dependencies installed.

echo.
echo ============================================================
echo  Setup Complete!
echo ============================================================
echo.
echo Starting servers in 5 seconds...
echo.
echo Frontend:  http://localhost:3000
echo Backend:   http://localhost:5000
echo.
echo Live Dashboard: http://localhost:3000/live
echo Trending:       http://localhost:3000/trending
echo Settings:       http://localhost:3000/settings
echo.

timeout /t 5 /nobreak

echo.
echo Starting Flask backend...
start cmd /k "cd backend && venv\Scripts\activate.bat && python app.py"

timeout /t 3 /nobreak

echo Starting Next.js frontend...
start cmd /k "npm run dev"

timeout /t 2 /nobreak

echo.
echo Both servers should be starting...
echo Check the opened terminal windows for status.
echo.
echo Open your browser to: http://localhost:3000
echo.
pause
