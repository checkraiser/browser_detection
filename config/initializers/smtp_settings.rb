ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'heroku.com',
  :user_name            => 'checkraiser11@gmail.com',
  :password             => 'Dung123#',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
