class SessionsController < ApplicationController
 # layout 'sessions'
  skip_before_action :user_signed_in?, except: :destroy


  def new
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to information_to_connects_path
    else
      redirect_to new_session_path, alert: "Неверный логин или пароль!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Сеанс работы завершен!"
  end
end
