import React, { useState } from 'react';
import Navigation from './components/Navigation';
import HeroSection from './components/HeroSection';
import WhyJoinSection from './components/WhyJoinSection';
import EventsSection from './components/EventsSection';
import PhotoGallery from './components/PhotoGallery';
import LeadershipSection from './components/LeadershipSection';
import SponsorsSection from './components/SponsorsSection';
import ContactSection from './components/ContactSection';
import Footer from './components/Footer';
import ScrollToTop from './components/ScrollToTop';
import SponsorForm from './components/SponsorForm';
import AdminPanel from './components/AdminPanel';
import AdminLink from './components/AdminLink';

function App() {
  const [isSponsorFormOpen, setIsSponsorFormOpen] = useState(false);

  // Check if we're on the admin page
  const isAdminPage = window.location.pathname === '/admin' || window.location.search.includes('admin=true');

  const openSponsorForm = () => {
    setIsSponsorFormOpen(true);
  };

  const closeSponsorForm = () => {
    setIsSponsorFormOpen(false);
  };

  // Add event listener for sponsor form buttons
  React.useEffect(() => {
    const handleSponsorClick = (e: Event) => {
      const target = e.target as HTMLElement;
      if (target.textContent?.includes('Sponsor Us')) {
        e.preventDefault();
        openSponsorForm();
      }
    };

    document.addEventListener('click', handleSponsorClick);
    return () => document.removeEventListener('click', handleSponsorClick);
  }, []);

  if (isAdminPage) {
    return <AdminPanel />;
  }

  return (
    <div className="App">
      <Navigation />
      <main>
        <HeroSection />
        <WhyJoinSection />
        <EventsSection />
        <PhotoGallery />
        <LeadershipSection />
        <SponsorsSection />
        <ContactSection />
      </main>
      <Footer />
      <ScrollToTop />
      <AdminLink />
      <SponsorForm isOpen={isSponsorFormOpen} onClose={closeSponsorForm} />
    </div>
  );
}

export default App;