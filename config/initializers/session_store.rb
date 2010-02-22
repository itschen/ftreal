# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ftreal_local_session',
  :secret      => '60e8e3d35e8a423e84a1312b473c8f32769b93cffb43ecea2c23a7698ee5d0f121660e6d72d818c5ca144dfe3081424733b1693d4c8695d61e2b043f94735b2f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
