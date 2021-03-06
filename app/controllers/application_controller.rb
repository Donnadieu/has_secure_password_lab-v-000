class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def require_login
    if !logged_in?
      redirect_to '/login'
    end
  end

  helper_method :current_user
end
