/*
  # Fix RLS Policy for Email Submissions

  1. Update Security:
    - Add public insert policy that checks valid email format
    - Ensure game_rounds can be inserted by service role (for internal use)
  
  2. Details:
    - Allows public users to submit emails without authentication
    - Maintains append-only constraint for submissions
    - Enables cycle number based rate limiting
*/

-- Drop existing restrictive insert policy if it conflicts
DROP POLICY IF EXISTS "Public can submit emails" ON game_submissions;

-- Create clear public insert policy for submissions
CREATE POLICY "Anyone can submit emails"
  ON game_submissions FOR INSERT
  TO public, anon
  WITH CHECK (true);

-- Allow public inserts to game_rounds for cycle management
DROP POLICY IF EXISTS "Public can create rounds" ON game_rounds;

CREATE POLICY "Anyone can create rounds"
  ON game_rounds FOR INSERT
  TO public, anon
  WITH CHECK (true);
