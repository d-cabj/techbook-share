class Item < ActiveRecord::Base
  belongs_to :category, counter_cache: :items_count
  belongs_to :admin_user
  has_many :likes
  has_many :purchaseHistories
  has_many :reviews
end
