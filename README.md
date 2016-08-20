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

- has_many :purchase_historys

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

- .string :title, index: true
- .text :discription
- .string :itemImg
- .references :category, foreign_key: true
- .integer :price
- .integer :postage

-----------
# PurchaseHistory
## association

- belongs_to :item

## table

- .references :user, foreign_key: true
- .references :item,

-----------
# Category
## association

- has_many :items

## table

- .string :name
