# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
 ActionMailer::Base.smtp_settings = {
  :user_name => ENV['USER_NAME'],
  :password => ENV['PASSWORD'],
  :domain => ENV['DOMAIN'],
  :address => ENV['ADDRESS'],
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}