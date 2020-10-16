class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name,                null: false
      t.string :author,              null: false
      t.date :publish_day,           null: false
      t.integer :stock,              null: false
      t.integer :genre_id,           null: false
      t.integer :code_id,            null: false
      t.integer :publisher_id,       null: false
      t.integer :condition_id,       null: false
      t.text :remark
      t.timestamps
    end
  end
end
