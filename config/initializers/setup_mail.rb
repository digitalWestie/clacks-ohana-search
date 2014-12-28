ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => ENV['SMTP_ADDRESS'],
  :port => ENV['SMTP_PORT'],
  :domain => ENV['SMTP_DOMAIN'],
  :user_name => ENV['SMTP_USER_NAME'],
  :password => ENV['SMTP_PASSWORD'],
  :authentication => ENV['SMTP_AUTHENTICATION'],
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options = {:host => ENV['DEFAULT_HOST'] }