class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def delete
  end

  def destroy
    set_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :address)
  end


end
