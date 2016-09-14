<!-- #モデル名

##アソシエーション
 -アソシエーションの記述
 -アソシエーションの記述

##テーブル名

-.型 :カラム名
-.型 :カラム名
 -->
-----------
# User
## association

- has_many :purchase_histories

## table

- .string :nickname
- .string :first_name
- .string :last_name
- .string :postcode
- .string :address
- .string :email
- .string :profileImg

-----------
# Item
## association

- belongs_to :category

## table

- .string :title
- .text :discription
- .string :condition
- .string :itemImg
- .references :category
- .integer :price
- .integer :postage
- .references :admin_user
- .integer :likes_count, default: 0


-----------
# PurchaseHistory
## association

- belongs_to :item

## table

- .references :user, foreign_key: true
- .references :item, foreign_key: true
- .string :first_name
- .string :last_name
- .string :telnumber
- .string :postcode
- .string :address
- .integer :total
- .string :email

-----------
# Category
## association

- has_many :items

## table

- .string :name
- .integer :items_count, default: 0

-----------
# AdminUser
## association

- has_many :items

## table

- .string :nickname

-----------
# like
## association

- belongs_to :item, counter_cache: :likes_count

## table

- .references :user
- .references :item
