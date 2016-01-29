class UsersController < ApplicationController
def index
end

def new
  @user = User.new
end

def create
  @user = User.create(user_params)
end

def edit
end

def show
end

private

def user_params
  params.require(:user).permit(:name, :email, :username, :address)
end

end
