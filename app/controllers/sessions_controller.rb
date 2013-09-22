class SessionsController < ApplicationController
  layout 'login'

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by(facebook_id: auth.uid) || User.create_from_facebook(auth)
    session[:user_id] = user.id
    redirect_to new_climb_path, notice: "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to logged_out_path, notice: "Signed out!"
  end
end
