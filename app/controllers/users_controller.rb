class UsersController < ApplicationController

  def new
    @user = User.new
    @errors = @user.errors
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up to Regifter, #{@user.username}!"
    else
      @errors = @user.errors
      render 'new'
    end
  end

  def edit
    set_user
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for updating your profile, #{@user.username}!"
    else
      @errors = @user.errors
      render 'edit'
    end
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @gifts = @user.get_user_gifts
    @completed_swaps = Swap.where("new_owner_id = ?", @user.id)
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
    params.require(:user).permit(:name, :email, :username, :address, :password, :password_confirmation)
  end
end
