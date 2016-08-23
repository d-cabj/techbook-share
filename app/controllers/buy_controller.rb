class BuyController < ApplicationController
  before_action :item

  def new
    @purchaseHistory = PurchaseHistory.new
  end

  def create
    binding.pry
    @purchase_information = PurchaseHistory.create(purchase_params)
  end

  private
  def purchase_params
    params.permit(:last_name, :first_name, :email, :telnumber, :postcode, :address, :total).merge(item_id: params[:id])
    # .merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
    @tax = (@item.price * 0.08.to_d).floor
    @total = @item.price + @item.postage + @tax
  end
end
