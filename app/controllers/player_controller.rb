class PlayerController < ApplicationController
  before_action :set_item, only: [:show, :archive, :favorite]

  def show
  end

  def all_archive
    if user_signed_in?
      current_user.items.each do |item|
        item.archive
      end
      redirect_to root_path
    end
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
  rescue
    redirect_to root_path
  end
end
