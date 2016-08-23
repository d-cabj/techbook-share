class CreatePurchaseHistories < ActiveRecord::Migration
  def change
    create_table :purchase_histories do |t|
      t.references :user
      t.references :item
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :telnumber
      t.string :postcode
      t.string :address
      t.integer :total
      t.timestamps null: false
    end
  end
end
