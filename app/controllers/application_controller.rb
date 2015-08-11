class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :user_signed_in?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Check logged user
  protected

  def user_signed_in?
    return if current_user
    redirect_to new_session_path, notice: "Пожалуйста, пройдите авторизацию!"
  end
end
