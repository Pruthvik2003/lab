# YouTube Analytics Dashboard - Complete File Manifest

## 📋 File Structure & Contents

### Root Configuration Files
- `package.json` - Node.js dependencies and scripts
- `tsconfig.json` - TypeScript configuration
- `tailwind.config.ts` - Tailwind CSS configuration (v4)
- `next.config.mjs` - Next.js configuration
- `postcss.config.mjs` - PostCSS configuration
- `.env.local` - Environment variables (frontend)
- `.env.example` - Example environment variables
- `start.sh` - Automated startup script for both servers

## 📖 Documentation Files
- `README.md` - Quick start guide and overview
- `DEPLOYMENT.md` - Complete deployment guide with instructions
- `FEATURES.md` - Detailed feature showcase and descriptions
- `PROJECT_SUMMARY.md` - High-level project summary
- `MANIFEST.md` - This file (complete file listing)

## 🎨 Frontend - Next.js Application

### App Directory (`app/`)
- `layout.tsx` - Root layout with metadata and dark theme
- `page.tsx` - Dashboard page with hero image and 8 statistics
  - Hero section with image overlay
  - 8 comprehensive stat cards with color variations
  - Peak Watching Hours chart
  - Video Type Performance chart
  - Call-to-action buttons

- `analytics/page.tsx` - Detailed analytics page
  - Deep Dive Analytics hero image
  - Overview statistics (3 top metrics)
  - Top Videos by Views chart
  - Category Performance breakdown
  - Watch Time Distribution chart
  - Peak Hours analysis

- `video-types/page.tsx` - Video types comparison page
  - Hero image for video comparison
  - Shorts vs Regular Videos metrics
  - Engagement Rate comparison
  - Type-specific performance charts
  - Content Type cards

- `user-insights/page.tsx` - User behavior & demographics page
  - User Behavior & Demographics hero image
  - Key user metrics (3 cards)
  - User Demographics by segment chart
  - Geographic Distribution heatmap
  - Watch Time by Demographics breakdown

- `globals.css` - Global styles and animations
  - Design tokens (colors, spacing, fonts)
  - Tailwind v4 imports
  - Custom keyframe animations:
    - `@keyframes float` - Floating effect
    - `@keyframes glow` - Glowing border effect
    - `@keyframes slideUp` - Slide up animation
    - `@keyframes fadeIn` - Fade in animation
  - Utility classes (`.animate-float`, `.hover-card`, etc.)

### Components (`components/`)
- `stat-counter.tsx` - Animated statistics card component
  - Displays metric label, value, icon, and suffix
  - Color variations (7 color schemes)
  - Hover animations with scale and rotation
  - Number counter animation
  - Responsive design

- `charts/chart-container.tsx` - Chart wrapper component
  - Responsive chart container
  - Loading states
  - Error handling
  - Consistent styling

### Hooks (`hooks/`)
- `use-mobile.tsx` - Mobile detection hook (pre-installed)
- `useAnalytics.ts` - Custom data fetching hooks with SWR
  - `useAnalyticsOverview()` - Total metrics
  - `useCategories()` - Category performance
  - `useTopVideos()` - Top 10 videos
  - `usePeakHours()` - Peak hours distribution
  - `useWatchTime()` - Watch time breakdown
  - `useVideosByType()` - Video type comparison
  - `useUserDemographics()` - User segments

### Libraries (`lib/`)
- `utils.ts` - Utility functions (cn for classname merging)
- `api-client.ts` - Axios-based API client
  - Base API configuration
  - Request/response interceptors
  - Error handling
  - Timeout configuration

### Public Assets (`public/`)
- `hero-dashboard.jpg` - Dashboard hero image (AI-generated)
- `hero-analytics.jpg` - Analytics page hero image
- `hero-video-types.jpg` - Video types comparison hero image
- `hero-user-insights.jpg` - User insights hero image
- Default favicon and app icons

### UI Components (`components/ui/` - shadcn/ui)
Pre-installed components:
- button, card, input, badge, alert, etc.

## 🐍 Backend - Python Flask API

### Main Application
- `backend/app.py` - Flask application (235+ lines)
  - CORS configuration
  - 7 REST API endpoints:
    - `GET /api/overview` - Total metrics
    - `GET /api/categories` - Category performance
    - `GET /api/top-videos` - Top videos by views
    - `GET /api/peak-hours` - Peak hours distribution
    - `GET /api/watch-time` - Watch time breakdown
    - `GET /api/video-types` - Video type comparison
    - `GET /api/demographics` - User demographics
  - Data processing with Pandas
  - JSON response formatting
  - Error handling

### Configuration
- `backend/requirements.txt` - Python dependencies
  - Flask==3.0.0
  - Flask-CORS==4.0.0
  - Pandas==2.0.3
  - NumPy==1.24.3
  - python-dotenv==1.0.0
  - gunicorn==21.2.0

- `backend/.env` - Backend environment variables
  - FLASK_ENV=development
  - FLASK_DEBUG=True
  - PORT=5000

### Data Files (`backend/data/`)
- `videos.csv` - Video metadata (50+ entries)
  - Columns: video_id, title, type, category, upload_date
  - Types: regular, short
  - Categories: tutorial, gaming, fitness, tech, vlog, music, education, entertainment

- `views.csv` - View records (100+ entries)
  - Columns: video_id, date_time, views, watch_time_minutes, user_count
  - Hourly data across 3 months
  - Realistic view patterns

- `user_data.csv` - User demographics (40+ segments)
  - Columns: segment_name, total_users, avg_watch_time_minutes, avg_videos_per_week, engagement_rate, preferred_type, country_code
  - 8 countries/regions
  - 8 user segments (students, professionals, creators, etc.)
  - Age and engagement metrics

## 🎯 Statistics & Metrics Generated

### Computed from Data Files
- **Total Views**: Sum of all views (150+)
- **Total Watch Time**: Sum of watch_time_minutes converted to hours
- **Completion Rate**: Calculated from watch duration vs video length
- **Total Users**: Unique users across all segments
- **Unique Videos**: Count of distinct videos
- **Avg Watch Time**: Average minutes per user
- **Engagement Rate**: Completion rate as percentage
- **Videos Per Month**: Video count divided by months

### Charts & Visualizations
- Peak Watching Hours (Line chart)
- Video Type Performance (Bar chart)
- Category Performance (Pie chart)
- Top Videos (Bar chart)
- Watch Time Distribution (Area chart)
- User Demographics (Donut chart)
- Geographic Distribution (Custom visualization)

## 🛠 Technologies & Libraries

### Frontend Stack
- **Framework**: Next.js 16 (React 19)
- **Language**: TypeScript
- **Styling**: Tailwind CSS v4
- **Animations**: Framer Motion
- **Charts**: Recharts
- **Data Fetching**: SWR (Stale-While-Revalidate)
- **HTTP Client**: Axios
- **Icons**: Lucide React
- **UI Components**: shadcn/ui
- **Package Manager**: pnpm

### Backend Stack
- **Framework**: Flask
- **Language**: Python 3.9+
- **Data Processing**: Pandas, NumPy
- **CORS**: Flask-CORS
- **Server**: Gunicorn (production)
- **Environment**: python-dotenv

## 🎨 Design System

### Color Palette (CSS Variables)
```css
--background: #0a0e27        /* Deep blue background */
--foreground: #ffffff        /* White text */
--card: #141b3d              /* Card background */
--primary: #6366f1           /* Indigo - primary accent */
--accent: #06b6d4            /* Cyan - secondary accent */
--chart-1: #6366f1           /* Purple */
--chart-2: #06b6d4           /* Cyan */
--chart-3: #8b5cf6           /* Violet */
--chart-4: #ec4899           /* Pink */
--chart-5: #f59e0b           /* Amber */
```

### Typography
- **Font Family**: Geist
- **Heading Sizes**: 1.5rem, 2rem, 2.5rem, 3rem, 3.5rem, 4rem
- **Body Size**: 0.875rem, 1rem, 1.125rem
- **Line Heights**: 1.4-1.6

### Spacing Scale
Uses Tailwind's default 0.25rem increments (p-1, p-2, etc.)

## 📱 Responsive Design

### Breakpoints
- **Mobile**: <640px (default)
- **Tablet**: 640px - 1024px (sm, md prefixes)
- **Desktop**: >1024px (lg, xl prefixes)

### Responsive Features
- Grid layouts adjust columns per screen
- Hero images scale responsively
- Statistics cards stack on mobile
- Navigation collapses on small screens
- Text sizes adjust for readability

## 🚀 Performance Optimizations

### Frontend
- Image optimization with Next.js Image component
- Lazy loading of components
- Code splitting per route
- SWR caching strategy
- Memoization of expensive computations

### Backend
- Efficient Pandas operations
- NumPy vectorized calculations
- CSV parsing on startup
- In-memory data caching

## 📊 API Response Examples

### `/api/overview`
```json
{
  "total_views": 150,
  "total_watch_time_hours": 29.0,
  "completion_rate": 85.0,
  "total_users": 28580,
  "unique_videos": 30,
  "avg_watch_time_minutes": 11.0
}
```

### `/api/categories`
```json
[
  {"category": "tutorial", "views": 45},
  {"category": "gaming", "views": 30},
  ...
]
```

## 🔐 Security Features

- Environment variables for sensitive data
- CORS configuration for API access
- Type safety with TypeScript
- Input validation in backend
- Error handling and logging

## 📦 Installation & Deployment

### Quick Start Commands
```bash
# Install all dependencies
pnpm install
cd backend && pip install -r requirements.txt

# Start development servers
./start.sh  # Uses startup script

# Build for production
pnpm build
```

### Deployment Targets
- Frontend: Vercel, Netlify, AWS S3 + CloudFront
- Backend: Heroku, Railway, AWS EC2, DigitalOcean

## 🎁 Bonus Features

### Extra Animations
- Float effect on stat cards
- Glow effect on hover
- Number counter animations
- Icon rotation on hover
- Smooth page transitions
- Loading skeleton screens

### Extra Visualizations
- 4 AI-generated hero images
- 6+ different chart types
- Color-coded metrics
- Icon indicators
- Gradient backgrounds
- Responsive layouts

### Extra Documentation
- Comprehensive README
- Detailed deployment guide
- Feature showcase document
- Project summary
- This manifest file

---

## 📌 Summary

**Total Files**: 50+
**Frontend Files**: 25+ (pages, components, hooks, styles)
**Backend Files**: 3+ (app.py, requirements.txt, .env)
**Data Files**: 3 (videos.csv, views.csv, user_data.csv)
**Documentation**: 5 (README, DEPLOYMENT, FEATURES, SUMMARY, MANIFEST)
**Public Assets**: 4 (hero images)

**Total Lines of Code**: 2000+
**Components**: 10+ (pages, stat-counter, charts, etc.)
**API Endpoints**: 7
**Data Records**: 150+
**Animations**: 10+
**Responsive Breakpoints**: 4

Everything you need to launch a professional YouTube analytics platform!
