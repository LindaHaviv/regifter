class GiftSwapsController < ApplicationController
  def index
  end

  def new
   @asked_gift = Gift.find(params[:asked_gift_id])
   @receiver = User.find(params[:receiver_id])
  end

  def create
   @gift_swap.sender = current_user
  end

end
