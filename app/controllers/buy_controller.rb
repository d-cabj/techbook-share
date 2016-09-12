class BuyController < ApplicationController
  before_action :item
  before_action :judge_login

  def new
    @purchaseHistory = PurchaseHistory.new
  end

  def create
    if params[:checkRulePolicy] == "0"
      redirect_to :back, alert: "利用規約、プライバシーポリシーに同意頂けたらボックスにチェックしてください"
    else
      purchase_params.each do |purchase_param|
        binding.pry
         unless purchase_param[1].present?
           redirect_to :back, alert: "全項目を入力してください"
           break
         end
      end
      @purchase_information = PurchaseHistory.create(purchase_params)
    end
  end

  private
  def purchase_params
    params.permit(:last_name, :first_name, :email, :telnumber, :postcode, :address, :total).merge(user_id: current_user.id, item_id: params[:id])
    # .merge(user_id: current_user.id)
  end

  def item
    @item = Item.find(params[:id])
    @tax = (@item.price * 0.08.to_d).floor
    @total = @item.price + @item.postage + @tax
  end
end
