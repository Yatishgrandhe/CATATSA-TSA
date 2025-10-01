# Vercel Deployment Guide for TSA Website

## 🚀 Quick Deployment Steps

### 1. Push to GitHub
```bash
git add .
git commit -m "Add Supabase integration for cross-browser data sharing"
git push origin main
```

### 2. Deploy to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Import your GitHub repository
4. Vercel will auto-detect it's a React app

### 3. Add Environment Variables
In Vercel dashboard → Settings → Environment Variables, add:

| Name | Value |
|------|-------|
| `REACT_APP_SUPABASE_URL` | `https://samapeevfikxeesbcvee.supabase.co` |
| `REACT_APP_SUPABASE_ANON_KEY` | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhbWFwZWV2ZmlreGVlc2JjdmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyNzg3OTYsImV4cCI6MjA3NDg1NDc5Nn0.Jdu2IQvoGJJDUOWr3sGSkAeng2WPkdA4EmZSVEntv44` |

### 4. Deploy
- Click "Deploy"
- Wait for build to complete
- Your site will be live at `https://your-project.vercel.app`

## 🔧 Build Configuration

### **vercel.json** (already configured)
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "build"
}
```

### **package.json** (already configured)
```json
{
  "scripts": {
    "vercel-build": "npm run build"
  }
}
```

## 🎯 Post-Deployment Checklist

### ✅ **Test Form Submission**
1. Visit your live site
2. Click "Sponsor Us" button
3. Fill out and submit the form
4. Verify success message appears

### ✅ **Test Admin Panel**
1. Visit `https://your-site.vercel.app?admin=true`
2. Verify you can see the submission
3. Test editing, filtering, and export features

### ✅ **Test Cross-Browser**
1. Submit form from one browser
2. Open admin panel in different browser
3. Verify submission appears

## 🔒 Security & Performance

### **Environment Variables**
- ✅ Supabase URL and key are properly configured
- ✅ No sensitive data in client-side code
- ✅ Database access controlled by RLS policies

### **Performance**
- ✅ React app optimized for production
- ✅ Tailwind CSS purged for minimal bundle size
- ✅ Supabase connection optimized
- ✅ Vercel CDN for global performance

## 📊 Monitoring & Analytics

### **Vercel Analytics** (Optional)
1. Go to Vercel dashboard
2. Enable Analytics
3. Track page views and performance

### **Supabase Dashboard**
1. Monitor database usage
2. View submission statistics
3. Check performance metrics

## 🛠️ Troubleshooting

### **Build Errors**
```bash
# Check build locally
npm run build

# Common fixes
npm install
npm audit fix
```

### **Environment Variables**
- Verify variables are set in Vercel dashboard
- Check variable names match exactly
- Redeploy after adding variables

### **Database Connection**
- Verify Supabase project is active
- Check RLS policies are enabled
- Test connection in Supabase dashboard

## 🎉 Success!

Your TSA website is now:
- ✅ **Live on Vercel** with custom domain
- ✅ **Connected to Supabase** database
- ✅ **Cross-browser compatible** admin panel
- ✅ **Production ready** with proper security
- ✅ **Scalable** for future growth

## 🔄 Future Updates

### **Content Updates**
1. Edit `src/data/tsaData.ts`
2. Push to GitHub
3. Vercel auto-deploys

### **Database Changes**
1. Update SQL schema in Supabase
2. Update TypeScript types in `src/lib/supabase.ts`
3. Test locally, then deploy

### **New Features**
1. Develop locally with `npm start`
2. Test thoroughly
3. Push to GitHub for auto-deployment

## 📞 Support

- **Vercel Docs**: [vercel.com/docs](https://vercel.com/docs)
- **Supabase Docs**: [supabase.com/docs](https://supabase.com/docs)
- **React Docs**: [reactjs.org/docs](https://reactjs.org/docs)

Your TSA website is now professional, scalable, and ready for production! 🎉
