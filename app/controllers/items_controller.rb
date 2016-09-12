class ItemsController < ApplicationController
  before_action :item, only: :show
  before_action :judge_login
  def index
  end

  def show
    @sameCategoryItems = Item.where(category_id: @item.category_id).order("created_at DESC").page(params[:page]).per(3)
  end

  private
  def item
    @item = Item.find(params[:id])
    @tax = (@item.price * 0.08.to_d).floor
    @total = @item.price + @item.postage + @tax
  end
end
