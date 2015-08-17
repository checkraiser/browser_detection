class MyDevise::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    record_client(resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def get_browser
    if request.env['HTTP_USER_AGENT'].downcase.match(/crome/i)
      "Crome"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/msie/i)
      "Internet Explorer"
   elsif request.env['HTTP_USER_AGENT'].downcase.match(/konqueror/i)
      "Konqueror"
   elsif request.env['HTTP_USER_AGENT'].downcase.match(/firefox/i)
      "Mozilla"
   elsif request.env['HTTP_USER_AGENT'].downcase.match(/opera/i)
      "Opera"
   elsif request.env['HTTP_USER_AGENT'].downcase.match(/safari/i)
      "Safari"
    else
      "Unknown"
    end
  end

  def get_operating_system
    if request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
      "Mac"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
      "Windows"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
      "Linux"
    elsif request.env['HTTP_USER_AGENT'].downcase.match(/unix/i)
      "Unix"
    else
      "Unknown"
    end
  end

  def get_client_ip
    request.remote_ip
  end

  def is_changed?(resource, browser, ip, os)
    return true if resource.browser != browser or resource.ip != ip or resource.os != os
    false
  end

  def record_client(resource)
    if is_changed?(resource, get_browser, get_client_ip, get_operating_system)
      resource.browser = get_browser
      resource.ip = get_client_ip
      resource.os = get_operating_system
      if resource.save
        begin
          LoginNotifier.send_client_info(resource).deliver
        rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
          console.log e.inspect
        end
      end
    end
  end
end
