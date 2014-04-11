class PlayerController < ApplicationController
  before_action :set_item, only: [:show, :archive, :favorite]

  def show
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
