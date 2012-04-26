module DefaultHelper

  def test
    "this is a test helper"
  end
  
  def link_to(name, page, html_options={})
    "<a href='#{page}' #{to_options_string(html_options)}>#{name}</a>"
  end

  def to_options_string(html_options)
    html_options.map {|k,v| "#{k}='#{v}'"}.join(' ')
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
    @current_user ||= user_from_token
  end
  
  private
  
  def user_from_token
    User.authenticate_with_token(remember_token)
  end
  
  def remember_token
    session[:user_token] || nil
  end
  
end