ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'heroku.com',
  :user_name            => ENV["USERNAME"],
  :password             => ENV["PASSWORD"],
  :authentication       => ENV["AUTHENTICATION"],
  :enable_starttls_auto => true
}
