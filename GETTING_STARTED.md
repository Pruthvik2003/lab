# Getting Started - YouTube Analytics Dashboard

Welcome to your enhanced YouTube Analytics Dashboard with real-time metrics, trending videos, and premium animations!

## Quick Start (Choose Your Method)

### Method 1: Automatic Setup (Recommended for Windows)

**Fastest way to get started!**

1. Extract the ZIP file to your desired location
2. Navigate into the folder in File Explorer
3. Double-click one of these files:
   - **Windows Command Prompt Users:** `START_DASHBOARD.bat`
   - **Windows PowerShell Users:** `START_DASHBOARD.ps1`
4. Wait for the setup to complete (2-3 minutes first time)
5. Two new windows will open automatically
6. Open your browser to: **http://localhost:3000**

**What happens automatically:**
- Creates Python virtual environment
- Installs all frontend packages
- Installs all Python packages
- Starts Flask backend on port 5000
- Starts Next.js frontend on port 3000
- Launches both in separate terminal windows

### Method 2: Manual Setup (All Platforms)

If the automatic scripts don't work, follow this manual approach:

#### Step 1: Open Terminal/Command Prompt

Navigate to your project folder:
```bash
cd path\to\youtube-analytics-dashboard
```

#### Step 2: Install Frontend Dependencies

```bash
npm install
```

This takes 2-3 minutes on first run.

#### Step 3: Setup Python Environment

**Create virtual environment:**
```bash
python -m venv backend\venv
```

**Activate it:**
- Windows Command Prompt: `backend\venv\Scripts\activate`
- Windows PowerShell: `backend\venv\Scripts\Activate.ps1`
- Mac/Linux: `source backend/venv/bin/activate`

**Install Python packages:**
```bash
cd backend
pip install -r requirements.txt
cd ..
```

#### Step 4: Start Backend Server

In your terminal (with venv activated):
```bash
cd backend
python app.py
```

You should see:
```
 * Running on http://127.0.0.1:5000
 * Press CTRL+C to quit
```

**Keep this window open!**

#### Step 5: Start Frontend Server

Open a **NEW** terminal/command prompt window:
```bash
cd path\to\youtube-analytics-dashboard
npm run dev
```

You should see:
```
- ready started server on 0.0.0.0:3000, url: http://localhost:3000
```

#### Step 6: Open Dashboard

In your web browser, go to:
```
http://localhost:3000
```

## What You'll See

### Dashboard (Home)
The main overview page with:
- 8 animated statistics cards
- Peak watching hours chart
- Video type comparison
- Navigation to other sections

### Live Dashboard (NEW!)
Real-time metrics at: `http://localhost:3000/live`
- Views per minute (updates every 3 seconds)
- Active viewers count
- Trending videos with badges
- Live activity stream
- Engagement metrics

### Trending (NEW!)
Top performing content at: `http://localhost:3000/trending`
- Top 10 videos ranked
- Growth percentage indicators
- Category breakdown
- Completion rate metrics

### Settings (NEW!)
Customization options at: `http://localhost:3000/settings`
- Notification preferences
- Display theme options
- Privacy settings
- Account information

### Original Pages
- **Analytics** (`/analytics`) - Deep dive analysis
- **Video Types** (`/video-types`) - Shorts vs Regular videos
- **User Insights** (`/user-insights`) - Audience demographics

## File Organization

After extraction, you'll have:

```
youtube-analytics-dashboard/
├── START_DASHBOARD.bat          ← Double-click to start (Windows)
├── START_DASHBOARD.ps1          ← Double-click to start (PowerShell)
├── app/                         ← All pages and layouts
├── components/                  ← React components
├── hooks/                       ← Data fetching logic
├── backend/                     ← Flask server & data
│   ├── app.py                  ← Main server file
│   ├── data/                   ← CSV data files
│   └── requirements.txt        ← Python packages
├── public/                      ← Images and assets
├── WINDOWS_SETUP.md            ← Detailed Windows guide
├── GETTING_STARTED.md          ← This file
├── ENHANCEMENTS.md             ← What's new in v2.0
├── REAL_TIME_QUICK_START.md    ← Feature overview
└── package.json                ← Frontend packages
```

## Common Issues & Solutions

### Issue: "python: command not found"
**Solution:**
1. Install Python from https://www.python.org/downloads/
2. During installation, check "Add Python to PATH"
3. Restart your terminal and try again

### Issue: "npm: command not found"
**Solution:**
1. Install Node.js from https://nodejs.org/
2. Choose the LTS (Long Term Support) version
3. Install it and restart your terminal

### Issue: Port 3000 is already in use
**Solution:**
Open a new terminal and run:
```bash
# Windows Command Prompt
netstat -ano | findstr :3000
taskkill /PID <number> /F

# Windows PowerShell
Get-Process -Name node | Stop-Process -Force

# Mac/Linux
lsof -i :3000 | grep LISTEN | awk '{print $2}' | xargs kill -9
```

Then try starting again.

### Issue: Port 5000 is already in use
**Solution:** 
Edit `backend/app.py` and change the port:
```python
if __name__ == '__main__':
    app.run(debug=True, port=5001)  # Change 5000 to 5001
```

### Issue: Virtual environment won't activate
**Command Prompt:**
```bash
backend\venv\Scripts\activate
```

**PowerShell (if you get permission error):**
```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
backend\venv\Scripts\Activate.ps1
```

### Issue: Frontend dependencies won't install
**Solution:**
```bash
npm install --no-optional
npm install --legacy-peer-deps
```

### Issue: Python packages won't install
**Solution:**
Make sure virtual environment is active (you should see `(venv)` in your terminal):
```bash
python -m pip install --upgrade pip
pip install -r backend\requirements.txt --upgrade
```

## Performance Tips

1. **First time load:** 2-3 minutes (installing packages)
2. **Subsequent starts:** 10-15 seconds
3. **Real-time updates:** Every 3-5 seconds
4. **Smooth animations:** 60fps on modern devices
5. **Data refresh:** Automatic via SWR caching

## Customization Quick Tips

### Change Dashboard Colors

Edit `app/globals.css`:
```css
:root {
  --primary: #6366f1;        /* Change the blue */
  --accent: #06b6d4;         /* Change the cyan */
  --background: #0a0e27;     /* Change the background */
}
```

### Adjust Real-Time Refresh Speed

Edit `hooks/useLiveAnalytics.ts`:
```typescript
const REFRESH_INTERVAL = 3000;  // Change from 3000ms to desired value
```

### Add Your Own Data

Replace CSV files in `backend/data/`:
- `videos.csv` - Video information
- `views.csv` - View records
- `user_data.csv` - User segments

## Next Steps

1. ✅ Run the dashboard (`http://localhost:3000`)
2. ✅ Explore all 7 pages
3. ✅ Watch real-time metrics update
4. ✅ Enjoy the animations
5. Read `ENHANCEMENTS.md` for technical details
6. Read `WINDOWS_SETUP.md` for advanced setup
7. Customize colors and data for your needs
8. Deploy to production (see `DEPLOYMENT.md`)

## Stopping the Dashboard

**To stop the servers:**
1. In the Flask window: Press `CTRL+C`
2. In the Next.js window: Press `CTRL+C`
3. Close both windows

## Browser Compatibility

Works great on:
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

## What's New in Version 2.0

This is an enhanced version with:
- ✨ 3 new pages (Live, Trending, Settings)
- ✨ Real-time data streaming
- ✨ 5 new React components
- ✨ Advanced animations & particle effects
- ✨ 4 new API endpoints
- ✨ Premium hero images
- ✨ Better UX and performance

See `ENHANCEMENTS.md` for complete details.

## Need Help?

1. Check this file's troubleshooting section
2. Read `WINDOWS_SETUP.md` for detailed setup guide
3. Read `ENHANCEMENTS.md` for technical details
4. Check the Flask terminal output for error messages
5. Check the Next.js terminal output for build issues

## Success Checklist

After setup, verify:
- [ ] Flask running on http://localhost:5000
- [ ] Next.js running on http://localhost:3000
- [ ] Dashboard homepage loads
- [ ] Live page shows real-time metrics
- [ ] Trending page shows top videos
- [ ] Settings page loads
- [ ] Animations are smooth
- [ ] Real-time updates working (watch numbers change)

If all checked, you're ready to go!

---

**Version:** 2.0 (Real-Time Enhanced)
**Last Updated:** 2026-05-29
**Dashboard Status:** Production Ready

Enjoy your YouTube Analytics Dashboard!
