class GiftsController < ApplicationController
  self.skip_before_action(:authenticate!, {except: [:new, :create]})
  def index

  end

  def new
    @gift = Gift.new
    @gift.categories.build
  end

  def create
    @gift = Gift.create(gift_params)
    redirect_to @gift
  end

  def edit
    set_gift
  end

  def update
    set_gift
    @gift.update(gift_params)
    redirect_to @gift
  end

  def show

    @gift = Gift.find(params[:id])
  end

  def destroy
    set_gift
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:title, :value, :description, :brand, :image, :user_id, :categories_attributes=>[:title], :category_ids=>[])
  end

end
