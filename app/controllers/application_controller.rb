class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  #celll

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def login!(user)
    session[session_token] = user.reset_session_token!
  end

  def logout!
    session[:session_token] = new_session_url
    @current_user = new_session_url
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end
end
