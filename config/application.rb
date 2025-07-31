# config/application.rb
require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed after this file.
    #
    # E.g.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    #
    # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
    # This is crucial for your Flutter app to communicate with your Rails API.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # In production, replace '*' with your Flutter app's domain(s)
        resource '*',
          headers: :any,
          methods: [ :get, :post, :put, :patch, :delete, :options, :head ]
      end
    end

    config.api_only = true

    # Explicitly set secret_key_base using RAILS_MASTER_KEY for all environments
    # This ensures it's picked up early.
    # The `require_master_key` in production.rb will still enforce its presence.
    config.secret_key_base = ENV["RAILS_MASTER_KEY"]
  end
end
