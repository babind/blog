class SessionsController < ApplicationController
 
  # def create
  #  user = User.from_omniauth(request.env["omniauth.auth"])
  	
  #    session[:user_id] = user.id
  #   redirect_to root_url
  # end
  def create
  auth = request.env["omniauth.auth"]
  user = User.where(:provider => auth['provider'], 
                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end

  
def new
  redirect_to '/auth/facebook'
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