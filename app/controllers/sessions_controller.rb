class SessionsController < ApplicationController
  before_action :set_user
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def new 
    redirect_to '/auth/facebook'
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private 
  def user_params
    params(:user).permit(:provider,:uid,:name)  
  end
  



end
