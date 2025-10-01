-- TSA Website Database Schema for Supabase
-- Run this SQL in your Supabase SQL Editor

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

-- Create policies for public access (since this is a public form)
-- Allow anyone to insert (submit forms)
CREATE POLICY "Allow public insert" ON sponsor_submissions
    FOR INSERT WITH CHECK (true);

-- Allow anyone to read (for admin panel - you might want to restrict this later)
CREATE POLICY "Allow public read" ON sponsor_submissions
    FOR SELECT USING (true);

-- Allow anyone to update (for admin panel - you might want to restrict this later)
CREATE POLICY "Allow public update" ON sponsor_submissions
    FOR UPDATE USING (true);

-- Allow anyone to delete (for admin panel - you might want to restrict this later)
CREATE POLICY "Allow public delete" ON sponsor_submissions
    FOR DELETE USING (true);

-- Optional: Create a view for easier querying
CREATE OR REPLACE VIEW sponsor_submissions_view AS
SELECT 
    id,
    created_at,
    company_name,
    contact_name,
    email,
    phone,
    sponsorship_level,
    message,
    status,
    -- Add computed fields
    CASE 
        WHEN status = 'new' THEN 'New'
        WHEN status = 'contacted' THEN 'Contacted'
        WHEN status = 'confirmed' THEN 'Confirmed'
        ELSE status
    END as status_display,
    CASE 
        WHEN sponsorship_level = 'Platinum' THEN '🏆 Platinum'
        WHEN sponsorship_level = 'Gold' THEN '🥇 Gold'
        WHEN sponsorship_level = 'Silver' THEN '🥈 Silver'
        WHEN sponsorship_level = 'Bronze' THEN '🥉 Bronze'
        ELSE '💼 Other'
    END as level_display
FROM sponsor_submissions;

-- Grant permissions on the view
GRANT SELECT ON sponsor_submissions_view TO anon;

-- Optional: Create a function to get submission statistics
CREATE OR REPLACE FUNCTION get_submission_stats()
RETURNS TABLE (
    total_count BIGINT,
    new_count BIGINT,
    contacted_count BIGINT,
    confirmed_count BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        COUNT(*) as total_count,
        COUNT(*) FILTER (WHERE status = 'new') as new_count,
        COUNT(*) FILTER (WHERE status = 'contacted') as contacted_count,
        COUNT(*) FILTER (WHERE status = 'confirmed') as confirmed_count
    FROM sponsor_submissions;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission on the function
GRANT EXECUTE ON FUNCTION get_submission_stats() TO anon;
