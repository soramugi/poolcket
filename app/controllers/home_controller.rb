class HomeController < ApplicationController
  def index
    @items = user_signed_in? ? current_user.items : []
  end
end
