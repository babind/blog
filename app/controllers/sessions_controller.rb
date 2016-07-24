class SessionsController < ApplicationController
 
  def create
   user = User.from_omniauth(request.env["omniauth.auth"])
  	# user = User.new(user_params)
     session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

    private

  def userparams
  params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat)
  end
end