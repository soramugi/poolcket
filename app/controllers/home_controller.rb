class HomeController < ApplicationController
  before_action :set_item, only: [:player, :archive, :favorite]

  def index
    @items = []

    if user_signed_in?
      @items = current_user.items
      @items = current_user.create_item if @items.blank?
    end
  end

  def player
    render layout: false
  end

  def archive
    if @item.archive
      render text: 'sucusess'
    else
      render text: 'failure'
    end
  end

  def favorite
    if @item.fav
      render text: 'sucusess'
    else
      render text: 'failure'
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
