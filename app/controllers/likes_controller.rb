class LikesController < ApplicationController
  before_action :set_item

  def create
    @item.likes.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    @item.likes.find_by(user_id: current_user.id).destroy
    @item.reload
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
