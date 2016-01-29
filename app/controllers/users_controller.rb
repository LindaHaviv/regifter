class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end

  def edit
  end


  def update
  end


  def show
  end


  def delete
  end

  def destroy
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :username, :address)
  end


end
