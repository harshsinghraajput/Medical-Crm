@echo off
echo ============================================
echo   AI-First CRM - HCP Module
echo ============================================
echo.
echo Starting Backend (FastAPI)...
echo.

cd /d "%~dp0crm-backend"

REM Check if virtualenv exists
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

REM Activate venv
call venv\Scripts\activate

REM Install dependencies
echo Installing dependencies...
pip install -r requirements.txt -q

REM Start server
echo.
echo Starting FastAPI server on http://localhost:8000
echo.
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

pause
