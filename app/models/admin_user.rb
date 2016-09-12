class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items
  # ユーザーが購入履歴から購入アイテムの参照を可能にするため、dependent: :destroyはしない

end
