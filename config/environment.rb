# Load the rails application
require File.expand_path('../application', __FILE__)
ActionMailer::Base.smtp_settings = {
  :address              => ENV["ADDRESS"],
  :port                 => ENV["PORT"],
  :domain               => ENV["DOMAIN"],
  :user_name            => ENV["USERNAME"],
  :password             => ENV["PASSWORD"],
  :authentication       => ENV["AUTHENTICATION"],
  :enable_starttls_auto => true
}

# Initialize the rails application
BrowserDetection::Application.initialize!
