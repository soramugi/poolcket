class HomeController < ApplicationController

  def index
    @items = []

    if user_signed_in?
      @items = current_user.items
      @items = current_user.create_item if @items.blank?
    end
  end

end
