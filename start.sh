#!/bin/bash

echo "🚀 YouTube Analytics Dashboard - Starting Services"
echo "=================================================="

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Python virtual environment exists
if [ ! -d "backend/.venv" ]; then
    echo -e "${YELLOW}Setting up Python virtual environment...${NC}"
    cd backend
    uv venv --python 3.9
    source .venv/bin/activate
    pip install -r requirements.txt
    cd ..
fi

# Start Flask backend
echo -e "${YELLOW}Starting Flask backend server...${NC}"
cd backend
source .venv/bin/activate
python app.py > /tmp/flask.log 2>&1 &
FLASK_PID=$!
cd ..
echo -e "${GREEN}✓ Flask backend running on http://localhost:5000${NC}"
echo "  Process ID: $FLASK_PID"

# Start Next.js frontend
echo -e "${YELLOW}Starting Next.js frontend...${NC}"
sleep 2
pnpm dev &
NEXT_PID=$!
echo -e "${GREEN}✓ Next.js frontend starting on http://localhost:3000${NC}"
echo "  Process ID: $NEXT_PID"

echo ""
echo -e "${GREEN}=================================================="
echo "✓ All services started successfully!"
echo "=================================================="
echo "Dashboard URL: http://localhost:3000"
echo "API URL: http://localhost:5000/api"
echo ""
echo "Press Ctrl+C to stop all services"
echo -e "${NC}"

# Handle Ctrl+C
trap "kill $FLASK_PID $NEXT_PID 2>/dev/null; exit" INT

# Wait for both processes
wait
