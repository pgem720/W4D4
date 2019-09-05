class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new
    if @user.save
      session[:session_token] = @user.reset_session_token!
      redirect_to users_url
    else
      flash.new[:errors] = @user.full_message
      render :new
    end
  end

  def show
    user = Users.find
    render :show
  end


end