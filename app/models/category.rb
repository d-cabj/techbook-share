class Category < ActiveRecord::Base
  has_many :items
end

# カテゴリー選択（セレクト）
# アソシエーションを用いる

# 状態選択（セレクト）
