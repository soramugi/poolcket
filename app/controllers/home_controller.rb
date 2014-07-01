class HomeController < ApplicationController

  def index
    if user_signed_in?
      @items = current_user.items
      @items = current_user.create_item if @items.blank?
      if @items.present?
        redirect_to player_path(@items.first.id)
      else
        # TODO 表示するの無いよ通知
      end
    end
  end

end
