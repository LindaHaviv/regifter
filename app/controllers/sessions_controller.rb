class SessionsController < ApplicationController
  skip_before_action :authenticate!
  def new
  end

  def create
    user = User.authenticate!(params[:session][:username], params[:session][:password])

    if user
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back, #{user.username}!"
    else
      redirect_to root_path
      flash[:error] = 'Bad username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have been logged out!'
  end
end
