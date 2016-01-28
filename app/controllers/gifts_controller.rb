class GiftsController < ApplicationController
  def index
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.create(gift_params)
  end

  def edit
  end

  def show
  end

  private

  def gift_params
    params.require(:gift).permit(:title, :value, :description, :brand, :image, :user_id)
  end

end
