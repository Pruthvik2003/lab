# YouTube Analytics Dashboard

A modern, animated analytics platform for YouTube creators that provides comprehensive insights into channel performance, user behavior, and content metrics.

## Features

- **Interactive Dashboard**: Real-time metrics and KPIs with animated counters
- **Advanced Analytics**: Detailed breakdowns by content category, video type, and time periods
- **Video Type Comparison**: Analyze performance of Regular Videos vs Shorts
- **User Demographics**: Understand your audience segments and their engagement patterns
- **Beautiful Visualizations**: Charts and graphs powered by Recharts with smooth animations
- **Dark Modern UI**: Professional dark theme with gradients and smooth transitions
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices

## Tech Stack

### Frontend
- **Next.js 15** - React framework with App Router
- **React** - UI library
- **TypeScript** - Type safety
- **Tailwind CSS** - Utility-first styling
- **Recharts** - Interactive charting library
- **Framer Motion** - Animation library
- **SWR** - Data fetching and caching
- **Axios** - HTTP client

### Backend
- **Python 3.8+** - Programming language
- **Flask** - Web framework
- **Flask-CORS** - Cross-origin resource sharing
- **Pandas** - Data manipulation and analysis
- **NumPy** - Numerical computing

## Project Structure

```
.
├── app/                          # Next.js app directory
│   ├── layout.tsx               # Root layout
│   ├── page.tsx                 # Dashboard home
│   ├── globals.css              # Global styles
│   ├── analytics/
│   │   └── page.tsx             # Detailed analytics page
│   ├── video-types/
│   │   └── page.tsx             # Video types comparison
│   └── user-insights/
│       └── page.tsx             # User demographics page
├── components/
│   ├── stat-counter.tsx         # Animated stat cards
│   └── charts/
│       └── chart-container.tsx  # Chart wrapper component
├── lib/
│   └── api-client.ts            # API client configuration
├── hooks/
│   └── useAnalytics.ts          # Custom data fetching hooks
├── backend/
│   ├── app.py                   # Flask application
│   ├── requirements.txt         # Python dependencies
│   └── data/
│       ├── videos.csv           # Video metadata
│       ├── views.csv            # View events
│       └── user_data.csv        # User demographics
└── public/                       # Static assets
```

## Getting Started

### Prerequisites
- Node.js 16+ and pnpm
- Python 3.8+ and pip
- Git

### Installation

1. **Clone the repository** (or download the ZIP)
```bash
cd youtube-analytics-dashboard
```

2. **Setup Frontend**
```bash
# Install Node dependencies
pnpm install

# Create environment file
cp .env.example .env.local

# Start the development server
pnpm dev
```

The frontend will be available at `http://localhost:3000`

3. **Setup Backend**
```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
venv\Scripts\activate

# Install Python dependencies
pip install -r requirements.txt

# Start Flask server
python app.py
```

The API will be available at `http://localhost:5000`

## Running Both Servers

You need to run both the frontend and backend servers:

### Terminal 1 - Frontend
```bash
pnpm dev
# Opens http://localhost:3000
```

### Terminal 2 - Backend
```bash
cd backend
source venv/bin/activate  # On macOS/Linux
python app.py
```

## API Endpoints

### Overview
- `GET /api/analytics/overview` - Key metrics (total views, watch time, completion rate)

### Videos
- `GET /api/videos` - List all videos
- `GET /api/analytics/by-type` - Performance by video type (Regular/Shorts)

### Analytics
- `GET /api/analytics/categories` - Views by content category
- `GET /api/analytics/watch-time` - Watch time distribution by user segment
- `GET /api/analytics/peak-hours` - Viewer activity by hour of day
- `GET /api/analytics/top-videos` - Top performing videos
- `GET /api/analytics/user-demographics` - User segment analysis

### Health
- `GET /health` - Server health check

## Sample Data

The project includes three CSV files with realistic YouTube analytics data:

### videos.csv
Contains metadata for 50 sample videos including:
- Video ID and title
- Content type (regular/short)
- Category
- Duration
- Upload date

### views.csv
Contains 150 view events with:
- Video ID
- Timestamp
- User segment
- Watch duration
- Device type
- Country
- Completion status

### user_data.csv
Contains user segment demographics:
- Segment name
- Total users
- Average watch time
- Videos watched per week
- Engagement rate
- Geographic distribution

## Features Explained

### Dashboard Home
- **Key Metrics Cards**: Animated counters showing total views, watch time, completion rate, and more
- **Peak Hours Chart**: Line chart showing viewer activity throughout the day
- **Video Type Performance**: Bar chart comparing Regular Videos vs Shorts

### Analytics Page
- **Category Breakdown**: Pie chart showing distribution by content category
- **Watch Time Distribution**: Radar chart showing watch time across user segments
- **Peak Hours Analysis**: Detailed bar chart with completion metrics
- **Top Videos Table**: Rankings of best-performing videos with completion rates

### Video Types Page
- **Type Comparison Cards**: Side-by-side statistics for Regular Videos and Shorts
- **Performance Charts**: Multiple visualizations comparing views and watch time
- **Metrics Comparison**: Detailed metrics dashboard
- **Insights**: Key findings about content type performance

### User Insights Page
- **Segment Analysis Table**: Detailed breakdown of user segments
- **Watch Time Distribution**: Bar chart by user segment
- **Engagement Profile**: Radar chart showing multi-dimensional engagement
- **Segment Cards**: Individual cards for each user segment
- **Viewing Patterns**: Line chart showing consumption patterns
- **Recommendations**: Data-driven suggestions for channel optimization

## Customization

### Colors & Theme
Edit `/app/globals.css` to customize the dark theme colors. Currently using:
- Primary: Indigo (#6366f1)
- Accent: Cyan (#06b6d4)
- Background: Dark Navy (#0a0e27)

### CSV Data
Replace the CSV files in `/backend/data/` with your actual YouTube analytics data.

### API Configuration
Update `NEXT_PUBLIC_API_URL` in `.env.local` to point to your backend server.

## Deployment

### Frontend (Vercel)
```bash
# Build the Next.js app
pnpm build

# Deploy to Vercel
pnpm vercel
```

### Backend (Python Hosting)
The backend can be deployed to services like:
- Heroku
- Railway
- Render
- PythonAnywhere
- AWS Elastic Beanstalk

Update the `NEXT_PUBLIC_API_URL` environment variable to point to your deployed backend.

## Performance Optimizations

- **SWR Caching**: Automatic data caching and revalidation
- **Code Splitting**: Automatic code splitting for each page
- **Image Optimization**: Next.js image optimization
- **CSS-in-JS**: Minimal CSS overhead with Tailwind CSS
- **Animation Performance**: GPU-accelerated animations with Framer Motion

## Browser Support

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers

## Troubleshooting

### "Cannot reach backend" error
- Ensure Flask server is running on `http://localhost:5000`
- Check `NEXT_PUBLIC_API_URL` in `.env.local`
- Verify CORS is enabled in Flask

### No data showing on charts
- Check that CSV files exist in `/backend/data/`
- Verify the Flask API returns data at `/api/analytics/overview`
- Check browser console for API errors

### Styling looks wrong
- Clear browser cache (Ctrl+Shift+R or Cmd+Shift+R)
- Rebuild the project: `pnpm build && pnpm dev`

## License

MIT

## Support

For issues or questions, please open an issue on GitHub.

## Future Enhancements

- [ ] Real-time data updates with WebSockets
- [ ] User authentication and multi-channel support
- [ ] Export reports to PDF/CSV
- [ ] Custom date range filtering
- [ ] Predictive analytics
- [ ] A/B testing tools
- [ ] Recommendation engine
- [ ] Mobile app
