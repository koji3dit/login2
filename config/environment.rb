# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
 ActionMailer::Base.smtp_settings = {
  :address        => Settings.sendgrid[:address],
  :port           => Settings.sendgrid[:port],
  :authentication => Settings.sendgrid[:authentication],
  :user_name      => Settings.sendgrid[:user_name],
  :password       => Settings.sendgrid[:password],
  :domain         => Settings.sendgrid[:domain],
  :enable_starttls_auto => true
}