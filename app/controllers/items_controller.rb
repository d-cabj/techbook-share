class ItemsController < ApplicationController
  before_action :item, only: :show
  before_action :judge_login
  def index
  end

  def show
    @sameCategoryItems = Item.where(category_id: @item.category_id).order("created_at DESC").page(params[:page]).per(3)
  end

  def search
    if params[:searchCategory].present? && params[:searchKeyword].present?
      @resultItems = Item.where(category_id: params[:searchCategory].to_i).where('title LIKE(?)', "%#{params[:searchKeyword]}%").page(params[:page]).per(3)
    elsif params[:searchCategories].present? && params[:searchKeyword].present? == false
      @resultItems = Item.where(category_id: params[:searchCategory].to_i).page(params[:page]).per(3)
    elsif params[:searchCategories].present? == false && params[:searchKeyword].present?
      @resultItems = Item.where('title LIKE(?)', "%#{params[:searchKeyword]}%").page(params[:page]).per(3)
    else
      @resultItems = Item.all.page(params[:page]).per(3)
    end
    @searchCategories = Category.all.map {|t| [t.name, t.id]}
    # @resultitems_count = @resultItems.count →kaminariのAPIで代用可能
  end

  private
  def item
    @item = Item.find(params[:id])
    @tax = (@item.price * 0.08.to_d).floor
    @total = @item.price + @item.postage + @tax
  end
end
