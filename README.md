# TSA Website - Central Academy of Technology and Arts

A professional, responsive website for the Central Academy of Technology and Arts TSA (Technology Student Association) chapter.

## Features

- **Modern Design**: Clean, professional layout with TSA and school branding
- **Responsive**: Fully mobile-friendly design that works on all devices
- **Interactive Events**: Expandable event cards with detailed descriptions and sponsor appeal
- **Sponsor Form**: Contact form with Supabase database integration
- **Admin Panel**: View and manage sponsor submissions from any browser
- **Cross-Browser Data**: Real-time data sharing across all devices
- **Easy Updates**: All content is easily configurable through the data files
- **Vercel Ready**: Optimized for deployment on Vercel

## Technology Stack

- **React 19** with TypeScript
- **Tailwind CSS 3** for styling
- **Supabase** for database and real-time features
- **Modern Fonts**: Montserrat for headings, Open Sans for body text
- **Responsive Design**: Mobile-first approach

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

3. Set up environment variables:
   Create a `.env` file in the root directory:
   ```env
   REACT_APP_SUPABASE_URL=https://samapeevfikxeesbcvee.supabase.co
   REACT_APP_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNhbWFwZWV2ZmlreGVlc2JjdmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyNzg3OTYsImV4cCI6MjA3NDg1NDc5Nn0.Jdu2IQvoGJJDUOWr3sGSkAeng2WPkdA4EmZSVEntv44
   ```

4. Set up the database:
   - Go to your Supabase dashboard
   - Run the SQL from `database-schema.sql` in the SQL Editor

5. Start the development server:
   ```bash
   npm start
   ```

6. Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

### Building for Production

```bash
npm run build
```

This creates a `build` folder with optimized production files.

## Customization

### Updating Content

All content is stored in `src/data/tsaData.ts`. You can easily update:

- School name and chapter information
- Leadership team members
- Meeting information
- Contact details
- Event descriptions

### Adding Images

1. Place images in the `public/images/` directory
2. Update the image paths in the components
3. The logo component includes fallback designs if images don't load

### Styling

The website uses Tailwind CSS with custom colors defined in `tailwind.config.js`:

- TSA Colors: Navy blue, red, white
- School Colors: Customizable primary and secondary colors

## Deployment

### Vercel (Recommended)

1. Connect your repository to Vercel
2. Add environment variables in Vercel dashboard:
   - `REACT_APP_SUPABASE_URL`
   - `REACT_APP_SUPABASE_ANON_KEY`
3. The `vercel.json` configuration is already set up
4. Deploy automatically on every push to main

See `VERCEL_DEPLOYMENT.md` for detailed instructions.

### Other Platforms

The built files in the `build` directory can be deployed to any static hosting service.

## Project Structure

```
src/
├── components/          # React components
│   ├── Navigation.tsx   # Header navigation
│   ├── HeroSection.tsx  # Landing section
│   ├── WhyJoinSection.tsx # Benefits section
│   ├── EventsSection.tsx # Competition events
│   ├── LeadershipSection.tsx # Team members
│   ├── SponsorsSection.tsx # Sponsorship info
│   ├── ContactSection.tsx # Contact & meeting info
│   ├── Footer.tsx       # Footer
│   ├── Logo.tsx         # Logo component
│   ├── SponsorForm.tsx  # Sponsor contact form
│   ├── AdminPanel.tsx   # Admin interface
│   └── AdminLink.tsx    # Admin access link
├── lib/
│   └── supabase.ts      # Supabase client and types
├── data/
│   └── tsaData.ts       # All content data
└── App.tsx              # Main app component
```

## Features Overview

### Navigation
- Sticky header that changes on scroll
- Smooth scrolling to sections
- Mobile-responsive hamburger menu

### Hero Section
- Compelling headline and mission statement
- Call-to-action buttons
- Placeholder for hero image/video

### Events Section
- Filterable by category
- Expandable cards with detailed information
- Sponsor appeal notes for each event

### Leadership Section
- Team member cards with placeholder images
- Easy to update with real photos

### Sponsors Section
- Tiered sponsorship levels
- Benefits overview
- Call-to-action for sponsorship packet

### Contact Section
- Meeting information
- Contact details
- Social media links

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is for educational use by the Central Academy of Technology and Arts TSA chapter.# CATATSA
