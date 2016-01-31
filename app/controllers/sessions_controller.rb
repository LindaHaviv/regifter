class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back, #{user.username}!"
    else
      redirect_to root_path
      flash[:error] = "Bad username or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out!"
  end

end
