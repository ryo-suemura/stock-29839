class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :quantity,                 null: false
      t.integer :item_id,                 null: false, foreign_key: true 
      t.integer :stock_id,                null: false, foreign_key: true  
      t.timestamps
    end
  end
end
