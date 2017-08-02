class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      # Find user with the email and authenticate with password.
      session[:user_id] = user.id
      flash[:info] = 'Başarıyla Giriş Yaptınız'
      redirect_to user_path(user)
    else
      flash[:error] = 'Email veya Parolanız Yanlış'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = 'Başarıyla Çıkış Yaptınız'
    redirect_to root_path
  end
end