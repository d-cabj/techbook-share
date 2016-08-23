class BuyController < ApplicationController

  def new
    @item = Item.find(params[:id])
    @purchaseHistory = PurchaseHistory.new
  end

  def create
    binding.pry
    電話番号がはいふんありでも保存できるように修正！！！
    PurchaseHistory.create(purchase_params)
    binding.pry
    # (last_name: purchase_params[:last_name], first_name: purchase_params[:first_name], telnumber: purchase_params[:telnumber], postcode: purchase_params[:postcode], address: purchase_params[:address], item_id: params[:id])
  end

  private
    def purchase_params
      params.permit(:last_name, :first_name, :email, :telnumber, :postcode, :address).merge(item_id: params[:id])
      # .merge(user_id: current_user.id, item_id: @item.id)
    end
end
