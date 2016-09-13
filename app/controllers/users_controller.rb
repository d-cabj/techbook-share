class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
  before_action :judge_login

  def show
    if current_user.id.to_s == params[:id]
      @profileImg = current_user.profileImg
      @purchaseBooks = PurchaseHistory.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    else
      redirect_to root_path, alert: "お客様ののマイページではありません"
    end
  end

  def update
    if user_address_params.present?
        current_user.update(user_address_params)
        sign_in(current_user, bypass: true)
        redirect_to :back, notice: "お客様の情報を更新しました"
    elsif user_email_password_params.present?
      binding.pry
      redirect_to :back, alert: "現在のパスワードの値が一致しませんでした" unless user_email_password_params(:old_email) == current_user.email
      current_user.update(user_email_password_params)
      sign_in(current_user, bypass: true)
      redirect_to :back, notice: "お客様の情報を更新しました"
    end
  end

  private
  def user_address_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :postcode, :address, :profileImg)
  end

  def user_email_password_params
    params.require(:user).permit(:email, :password, :old_email)
  end
end
