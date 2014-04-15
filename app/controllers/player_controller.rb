class PlayerController < ApplicationController
  before_action :set_item, only: [:show, :archive, :favorite]

  def show
    render layout: false
  end

  def archive
    render text: @item.archive ? 'sucusess' : 'failure'
  end

  def favorite
    render text: @item.fav ? 'sucusess' : 'failure'
  end

  private
  def set_item
    @item = Item.find(params[:id])
    raise unless ! user_signed_in? || current_user.id == @item.user_id
  end
end
