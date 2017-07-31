class UsersController < ApplicationController
  before_action :authorize, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path, notice: "Kaydedilemedi."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    redirect_to root_path unless params[:id] == current_user.id.to_s
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
