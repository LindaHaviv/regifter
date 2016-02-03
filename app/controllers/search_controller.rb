class SearchController < ApplicationController

  def index
    if params[:query].present?
      @gifts = Gift.search(params[:query])
    else
      @gifts = Gift.all
    end

  end

  # def autocomplete
  #   binding.pry
  #   render json: Gift.where('name ilike ?', "%#{params[:query]}%")
  # end

  # def create
  #   binding.pry
  # end
end
