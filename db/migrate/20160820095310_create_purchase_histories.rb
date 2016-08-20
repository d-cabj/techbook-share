class CreatePurchaseHistories < ActiveRecord::Migration
  def change
    create_table :purchase_histories do |t|
      t.references :user
      t.references :item
      t.timestamps null: false
    end
  end
end
