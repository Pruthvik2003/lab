# YouTube Analytics Dashboard - PowerShell Startup Script
# This script sets up and starts both the Flask backend and Next.js frontend

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  YouTube Analytics Dashboard - Real-Time Edition" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>&1
    Write-Host "Detected Python: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Python from https://www.python.org/downloads/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit
}

# Check if Node is installed
try {
    $nodeVersion = node --version
    Write-Host "Detected Node.js: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit
}

Write-Host ""
Write-Host "Step 1: Creating Python virtual environment..." -ForegroundColor Yellow

if (-not (Test-Path "backend\venv")) {
    python -m venv backend\venv
    Write-Host "Virtual environment created." -ForegroundColor Green
} else {
    Write-Host "Virtual environment already exists." -ForegroundColor Green
}

Write-Host ""
Write-Host "Step 2: Installing frontend dependencies..." -ForegroundColor Yellow

if (-not (Test-Path "node_modules")) {
    npm install --silent
    Write-Host "Frontend dependencies installed." -ForegroundColor Green
} else {
    Write-Host "Frontend dependencies already installed." -ForegroundColor Green
}

Write-Host ""
Write-Host "Step 3: Installing Python dependencies..." -ForegroundColor Yellow

# Activate virtual environment
& "backend\venv\Scripts\Activate.ps1"
pip install -q -r backend\requirements.txt
Write-Host "Python dependencies installed." -ForegroundColor Green

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting servers..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Frontend:  http://localhost:3000" -ForegroundColor Green
Write-Host "Backend:   http://localhost:5000" -ForegroundColor Green
Write-Host ""
Write-Host "New Pages:" -ForegroundColor Cyan
Write-Host "  Live Dashboard: http://localhost:3000/live" -ForegroundColor Green
Write-Host "  Trending:       http://localhost:3000/trending" -ForegroundColor Green
Write-Host "  Settings:       http://localhost:3000/settings" -ForegroundColor Green
Write-Host ""

# Start Flask backend in new PowerShell window
Write-Host "Starting Flask backend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit -Command `"cd '$PSScriptRoot\backend'; . venv\Scripts\Activate.ps1; python app.py`""

Start-Sleep -Seconds 3

# Start Next.js frontend
Write-Host "Starting Next.js frontend..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit -Command `"cd '$PSScriptRoot'; npm run dev`""

Start-Sleep -Seconds 2

Write-Host ""
Write-Host "Both servers are starting in new windows..." -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT:" -ForegroundColor Yellow
Write-Host "  1. Two new PowerShell windows should open shortly"
Write-Host "  2. Keep both windows open while using the dashboard"
Write-Host "  3. Open your browser to: http://localhost:3000" -ForegroundColor Green
Write-Host "  4. Press Ctrl+C in either window to stop"
Write-Host ""

Read-Host "Press Enter to continue..."
