# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_4x4supplies_session',
  :secret      => '3ab58cf3952272375caca5568fd4da725257da26d01392173bd668e3f4a6d596bd3871298242ebdfea3b6a979c7b9677ac067049f8c3b0f4d8e6fa79b3add4c2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
