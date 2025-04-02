Rails.application.configure do
  # config.after_initialize do
  #   Bullet.enable        = true
  #   Bullet.alert         = true
  #   Bullet.bullet_logger = true
  #   Bullet.console       = true
  # # Bullet.growl         = true
  #   Bullet.rails_logger  = true
  #   Bullet.add_footer    = true
  # end

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.action_cable.disable_request_forgery_protection = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :google_dev

  config.active_storage.service_urls_expire_in = 1.years

  # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false

  # config.action_mailer.perform_caching = true

  # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  ActionMailer::Base.delivery_method = :smtp

  Rails.application.routes.default_url_options = {
    host: '.lvh.me:3000',
    protocol: 'http',
    subdomain: lambda { Apartment::Tenant.current }
  }

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker


  config.hosts << '.lvh.me'

  # ActionMailer::Base.smtp_settings = {
  #   user_name: ENV.fetch('MAILGUN_SMTP_LOGIN'),
  #   password: ENV.fetch('MAILGUN_SMTP_PASSWORD'),
  #   domain: ENV.fetch('MAILGUN_DOMAIN'),
  #   address: ENV.fetch('MAILGUN_SMTP_SERVER'),
  #   port: ENV.fetch('MAILGUN_SMTP_PORT'),
  #   authentication: :plain,
  #   enable_starttls_auto: true
  # }

end
