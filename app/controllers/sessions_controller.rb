class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = user.find_by_credentials(params[user :email][user :password])
    if user
      session[:session_token] = @user.reset_session_token!
      redirect_to user_show
    else
      flash.new[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    session[:session_toekn] = nil
    current_user.reset_session_token!
    redirect_to users_show
  end

end