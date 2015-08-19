class LoginNotifier < ActionMailer::Base
  default :from => 'checkraiser11@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_client_info(user)
    @user = user
    Rails.logger.info user.identifier
    mail(:to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end

end
