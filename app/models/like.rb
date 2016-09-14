class Like < ActiveRecord::Base
  belongs_to :item, counter_cache: :likes_count
end
