=begin
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.servername.com",
  :port => 587,
  :domain => "whatever.org",
  :user_name => "username",
  :password => "password",
  :authentication => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options = {:host => "127.0.0.1:3000"}
=end