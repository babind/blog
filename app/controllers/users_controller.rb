class UsersController < ApplicationController

def create
    user = User.from_omniauth(env["omniauth.auth"])
  	 user = User.new(user_params)
     session[:user_id] = user.id
    redirect_to root_url
  end

  private
	def user_params
	 params.require(:user).permit(:uid,:name,:provider,:oauth_token,:oauth_expires_at)
	end


end
