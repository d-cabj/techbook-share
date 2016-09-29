class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.text :review
      t.references :user, index: true
      t.references :item, index: true
      t.timestamps
    end
  end
end
