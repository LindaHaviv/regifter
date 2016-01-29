class GiftsController < ApplicationController
  def index

  end

  def new
    @gift = Gift.new
      # binding.pry
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
    params.require(:gift).permit(:title, :value, :description, :brand, :image, :user_id, :categories_attributes=>[:title], :category_ids=>[])
  end

end
