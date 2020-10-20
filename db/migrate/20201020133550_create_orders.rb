class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity,                null: false
      t.integer :user_id,                 null: false, foreign_key: true 
      t.integer :stock_id,                null: false, foreign_key: true  
      t.timestamps
    end
  end
end
