class SearchController < ApplicationController
  def index
    if params[:query].present?
      @gifts = Gift.search(params[:query]).get_all_gifts
    else
      @gifts = Gift.get_all_gifts
    end
  end

end
