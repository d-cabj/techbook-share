class ItemsController < ApplicationController
  before_action :item, only: :show
  def index
  end

  def show
  end

  private
  def item
    @item = Item.find(params[:id])
    @tax = (@item.price * 0.08.to_d).floor
    @total = @item.price + @item.postage + @tax
  end
end
