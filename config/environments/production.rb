# config/environments/production.rb
require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This ensures that you don't have to restart the web server for
  # changes to take effect.
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for test purposes, you may have this set to true.
  config.eager_load = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in ENV["RAILS_MASTER_KEY"],
  # or in config/master.key. This key is used to decrypt credentials.
  # If you are seeing "ArgumentError: key must be 16 bytes", this is likely the issue.
  # Ensure RAILS_MASTER_KEY is set correctly in Render's environment variables.
  # IMPORTANT: Commenting out or removing config.require_master_key for testing purposes
  # if you are not using encrypted credentials and facing persistent ArgumentError.
  # config.require_master_key = true # Commented out

  # The secret_key_base is now explicitly set in config/application.rb.
  # This line is no longer strictly needed here, but keeping it for clarity
  # if you ever decide to manage it differently.
  # config.secret_key_base = ENV["RAILS_MASTER_KEY"]

  # Disable serving static files from the Rails server.
  # This is typically handled by a CDN or web server (like Nginx on Render).
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Compress CSS using a CSS compressor.
  # config.assets.css_compressor = :sass # Commented out

  # Do not fallback to assets pipeline if a precompiled asset is missing.
  # config.assets.compile = false # Commented out

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "ws://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # Enable locale fallbacks for I18n (makes lookups for corresponding requests fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Use default logging formatter so that "logs/production.log" is readable on Render.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable DNS prefetching for assets.
  # config.action_view.dns_prefetch_control = { prefetch: true }

  # Enable for performance monitoring (e.g., with AppSignal, New Relic)
  # config.log_level = :info
end
