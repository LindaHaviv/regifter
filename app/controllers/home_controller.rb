class HomeController < ApplicationController
  def index
    @gifts = Gift.get_all_gifts.slice(0, 12)
  end

  def contact
  end

end
