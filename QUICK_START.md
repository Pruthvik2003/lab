# YouTube Analytics Dashboard - Quick Start Guide

## ⚡ 3-Minute Setup

### Step 1: Install Dependencies (1 min)
```bash
pnpm install
cd backend && pip install -r requirements.txt
cd ..
```

### Step 2: Start Backend (Terminal 1)
```bash
cd backend
source .venv/bin/activate  # Windows: .venv\Scripts\activate
python app.py
```

✓ Backend running on http://localhost:5000

### Step 3: Start Frontend (Terminal 2)
```bash
pnpm dev
```

✓ Frontend running on http://localhost:3000

## 🎯 Open in Browser
Visit: **http://localhost:3000**

## 📊 Explore 4 Pages

| Page | URL | What It Shows |
|------|-----|---------------|
| Dashboard | `/` | Overview metrics & charts |
| Analytics | `/analytics` | Deep dive into performance |
| Video Types | `/video-types` | Shorts vs Regular comparison |
| User Insights | `/user-insights` | Audience demographics |

## 🎨 What You'll See

✨ **Modern Dark Theme** with vibrant accent colors
🎥 **AI-Generated Hero Images** on each page
📈 **8 Statistics Cards** with animated counters
📊 **6 Different Chart Types** showing real data
🎯 **150+ Sample Data Records** in CSVs

## 📝 Sample Metrics Displayed

- **Total Views**: 150
- **Watch Time**: 29 hours
- **Users**: 28,580
- **Engagement**: 85%
- **Video Types**: Regular + Shorts
- **Categories**: 8 types
- **Countries**: 8 regions
- **Age Groups**: Multiple segments

## 🛠 Customize

### Change Data
Edit files in `backend/data/`:
- `videos.csv` - Add/modify videos
- `views.csv` - Add view records
- `user_data.csv` - Add user segments

### Change Colors
Edit `app/globals.css`:
- Search for `--primary`, `--accent`, `--chart-1`, etc.
- Update hex color values

### Add New Metrics
1. Edit `backend/app.py` - Add new API endpoint
2. Edit `hooks/useAnalytics.ts` - Add data fetching hook
3. Add component to a page

## 🚀 Deploy to Production

### Deploy Frontend to Vercel
```bash
vercel deploy
```

### Deploy Backend to Heroku
```bash
cd backend
heroku create your-app-name
git push heroku main
```

## 📱 Mobile Responsive?
Yes! ✓ Fully responsive design:
- Mobile: <640px
- Tablet: 640-1024px  
- Desktop: >1024px

## 🐛 Troubleshooting

### Backend won't start?
```bash
# Check if port 5000 is in use
lsof -i :5000

# Kill process if needed
kill -9 <PID>

# Try a different port
FLASK_ENV=development FLASK_DEBUG=True PORT=5001 python app.py
```

### Frontend can't reach backend?
- Check NEXT_PUBLIC_API_URL in `.env.local`
- Ensure backend is running on port 5000
- Check browser console for CORS errors

### CSV data not loading?
- Verify files are in `backend/data/` directory
- Check file names are exact: `videos.csv`, `views.csv`, `user_data.csv`
- Check CSV format matches expected columns

## 📚 Full Documentation
- `README.md` - Overview and setup
- `DEPLOYMENT.md` - Production deployment
- `FEATURES.md` - Detailed feature list
- `MANIFEST.md` - Complete file listing
- `PROJECT_SUMMARY.md` - Project overview

## 💡 Quick Tips

### Performance
- Data is cached with SWR
- Images are optimized
- Charts render efficiently

### Customization
- All colors are CSS variables
- All animations are in `globals.css`
- All data comes from CSVs

### Development
- Use TypeScript for new components
- Use SWR for data fetching
- Use Tailwind for styling

## 🎁 Features at a Glance

✅ Dark modern theme
✅ 4 complete pages
✅ 7 API endpoints
✅ 6 chart types
✅ 150+ data records
✅ Smooth animations
✅ Hero images
✅ Responsive design
✅ Full TypeScript
✅ Complete documentation

## 🔗 Tech Stack

**Frontend**: Next.js, React, TypeScript, Tailwind, Framer Motion, Recharts
**Backend**: Flask, Python, Pandas, NumPy
**Data**: CSV files with 150+ records
**Deployment**: Vercel (frontend), Heroku/Railway (backend)

## ✨ Enjoy!

Your YouTube analytics dashboard is ready to explore. Customize it, deploy it, or use it as a learning resource for full-stack development.

Happy coding! 🚀
