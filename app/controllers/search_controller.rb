class SearchController < ApplicationController
  def index
    @gifts = if params[:query].present?
               Gift.search(params[:query])
             else
               Gift.all
    end
  end

end
