class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :discription
      t.string :itemImg
      t.references :category
      t.integer :price
      t.integer :postage
      t.timestamps null: false
    end
  end
end
