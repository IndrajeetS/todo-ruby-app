#!/usr/bin/env bash
set -o errexit

# Install dependencies
bundle install

# Precompile assets (if your app has a frontend)
# This step is only needed if your Rails app serves its own assets
# If you are building a pure API, you might not need this.
# RAILS_ENV=production bundle exec rails assets:precompile

# Run database migrations
# This is handled by the 'release' command in Procfile,
# but can also be included here if you prefer a single build step.
# If you use the 'release' command in Procfile, you can comment this out.
# bundle exec rails db:migrate

echo "Build script finished successfully."
