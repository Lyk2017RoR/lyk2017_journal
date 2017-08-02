class UsersController < ApplicationController
  before_action :authorize, only: :show
  def new
    @user = User.new
    @user.build_profile if @user.profile.nil?
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

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.build_profile if @user.profile.nil?
  end

  def show
    redirect_to root_path unless params[:id] == current_user.id.to_s
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [ :first_name, :last_name ])
  end
end
