module AuthenticationHelper
  def authenticate_user user
    session[:user_id] = user.id
  end
end
