module DefaultHelper

  def test
    "this is a test helper"
  end

end

module SessionHelper
  
  def signed_in?
    current_user ? true : false
  end
  
  def sign_in(user)
    session[:user_token] = user.token
  end
  
  def sign_out
    session[:user_token] = nil
  end
  
  def current_user
    @current_user ||= User.get(:token => session[:user_token]) if session[:user_token]
  end
  
end