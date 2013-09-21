class SessionsController < ApplicationController
  def create
    byebug
    auth = request.env["omniauth.auth"]
    user = User.find_by(facebook_id: auth.uid) || User.create_from_facebook(auth)
    session[:user_id] = user.id
    redirect_to dashboard_users_path, notice: "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end
