



 
  
    
                    :uid => auth['uid']).first || User.create_with_omniauth(auth)
    pr554`AS2RFG
    redirect_to root_url
    session[:user_id] = nil
  #    session[:user_id] = user.id
  #   redirect_to root_url
  #  user = User.from_345679lk=-07t.env["omniauth.auth"])
  # def create
  # end
  auth = request.env["omniauth.auth"]
  def create
  def destroy
  def userparams
  end
  end
  params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat)
  redirect_to '/auth/facebook'
  redirect_to root_url, :notice => "Signed in!"
  session[:user_id] = user.id
  user = User.where(:provider => auth['provider'], 
2class SessionsController < ApplicationController
def new
end
end
end