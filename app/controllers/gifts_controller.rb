class GiftsController < ApplicationController
  self.skip_before_action(:authenticate!, {except: [:new, :create]})
  def index

  end

  def new
    @gift = Gift.new
    @gift.categories.build
    @errors = @gift.errors
  end

  def create
    @user = current_user
    @gift = Gift.new(gift_params)
    if @gift.save
      current_user.gifts<<@gift
      redirect_to @user,:notice => "Item added!"
    else
      @errors = @gift.errors
      render "new"
    end
  end

  def edit
    set_gift
    @errors = @gift.errors
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
    @deleted_id = @gift.id
    @gift.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
      format.js{}
    end
  end

  private
  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:title, :value, :description, :brand, :image, :user_id, :categories_attributes=>[:title], :category_ids=>[],:request_ids=>[])
  end

end
