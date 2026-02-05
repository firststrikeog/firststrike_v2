/*
  # Enable Realtime for Submissions Table
  
  Enables postgres_changes realtime events on game_submissions table
  so that new submissions appear immediately in the UI for all users.
*/

BEGIN;
  ALTER PUBLICATION supabase_realtime ADD TABLE game_submissions;
COMMIT;
