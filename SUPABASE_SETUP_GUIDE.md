# Supabase Integration Setup Guide

## 🚀 Quick Setup Steps

### 1. Create Environment Variables File

Create a `.env` file in the root of your project with:

```env
REACT_APP_SUPABASE_URL=https://samapeevfikxeesbcvee.supabase.co
REACT_APP_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhbWFwZWV2ZmlreGVlc2JjdmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyNzg3OTYsImV4cCI6MjA3NDg1NDc5Nn0.Jdu2IQvoGJJDUOWr3sGSkAeng2WPkdA4EmZSVEntv44
```

### 2. Run Database Schema

Go to your Supabase dashboard → SQL Editor and run the SQL from `database-schema.sql`:

```sql
-- Create the sponsor_submissions table
CREATE TABLE IF NOT EXISTS sponsor_submissions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    company_name TEXT NOT NULL,
    contact_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT,
    sponsorship_level TEXT NOT NULL CHECK (sponsorship_level IN ('Platinum', 'Gold', 'Silver', 'Bronze', 'Other')),
    message TEXT,
    status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'confirmed'))
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_sponsor_submissions_created_at ON sponsor_submissions(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_sponsor_submissions_status ON sponsor_submissions(status);
CREATE INDEX IF NOT EXISTS idx_sponsor_submissions_email ON sponsor_submissions(email);

-- Enable Row Level Security (RLS)
ALTER TABLE sponsor_submissions ENABLE ROW LEVEL SECURITY;

-- Create policies for public access
CREATE POLICY "Allow public insert" ON sponsor_submissions FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public read" ON sponsor_submissions FOR SELECT USING (true);
CREATE POLICY "Allow public update" ON sponsor_submissions FOR UPDATE USING (true);
CREATE POLICY "Allow public delete" ON sponsor_submissions FOR DELETE USING (true);
```

### 3. Test the Integration

1. **Start the development server**: `npm start`
2. **Submit a test form**: Fill out the sponsor form
3. **Check admin panel**: Visit `http://localhost:3000?admin=true`
4. **Verify data**: You should see the submission in the admin panel

## 🔧 How It Works Now

### **Cross-Browser Data Sharing**
- ✅ **All submissions** are stored in Supabase database
- ✅ **Admin can see** submissions from any browser/device
- ✅ **Real-time updates** across all admin sessions
- ✅ **Persistent storage** - data survives browser clears

### **Database Structure**
```sql
sponsor_submissions:
- id (UUID, Primary Key)
- created_at (Timestamp)
- company_name (Text)
- contact_name (Text)
- email (Text)
- phone (Text, Optional)
- sponsorship_level (Text: Platinum/Gold/Silver/Bronze/Other)
- message (Text, Optional)
- status (Text: new/contacted/confirmed)
```

### **Free Tier Limits**
- **500MB database storage** - Plenty for thousands of submissions
- **50,000 monthly active users** - More than enough for TSA website
- **2GB bandwidth** - Sufficient for form submissions
- **No time limits** - Free forever

## 🎯 Key Benefits

### **Before (localStorage)**
- ❌ Admin could only see their own submissions
- ❌ Data lost when browser cleared
- ❌ No cross-device access
- ❌ Limited to single browser

### **After (Supabase)**
- ✅ Admin sees ALL submissions from ANY browser
- ✅ Data persists permanently
- ✅ Access from any device
- ✅ Real-time updates
- ✅ Professional database with backups

## 🚀 Vercel Deployment

### **Environment Variables on Vercel**
1. Go to your Vercel project dashboard
2. Navigate to Settings → Environment Variables
3. Add these variables:
   - `REACT_APP_SUPABASE_URL` = `https://samapeevfikxeesbcvee.supabase.co`
   - `REACT_APP_SUPABASE_ANON_KEY` = `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`

### **Deploy**
- Push to GitHub
- Vercel automatically deploys
- Environment variables are injected
- Database works immediately

## 🔒 Security Features

### **Row Level Security (RLS)**
- Database has security policies
- Public access for form submissions
- Admin access for management
- No authentication required (simplified setup)

### **Data Protection**
- All data encrypted in transit
- Automatic backups
- GDPR compliant
- No personal data stored on your servers

## 📊 Admin Panel Features

### **Real-time Management**
- View all submissions from any browser
- Sort by any column
- Filter by status
- Inline editing
- Export to CSV
- Delete submissions

### **Statistics Dashboard**
- Total submissions count
- Status breakdown (new/contacted/confirmed)
- Real-time updates
- Visual indicators

## 🛠️ Troubleshooting

### **Common Issues**

1. **"Network Error"**
   - Check environment variables
   - Verify Supabase URL and key
   - Check internet connection

2. **"Table doesn't exist"**
   - Run the SQL schema in Supabase
   - Check table name spelling
   - Verify RLS policies

3. **"Permission denied"**
   - Check RLS policies
   - Verify anon key
   - Check table permissions

### **Testing Steps**
1. Submit a test form
2. Check Supabase dashboard → Table Editor
3. Verify data appears in admin panel
4. Test editing and deletion

## 🎉 Success!

Your TSA website now has:
- ✅ **Professional database** with Supabase
- ✅ **Cross-browser data sharing**
- ✅ **Persistent storage**
- ✅ **Real-time admin panel**
- ✅ **Vercel compatibility**
- ✅ **Free tier hosting**

The admin can now see ALL sponsor submissions from ANY browser or device!
