class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :number,             null: false
      t.string :name,                null: false
      t.string :author,              null: false
      t.integer :stock,              null: false
      t.integer :genre_id,           null: false
      t.integer :code_id,            null: false
      t.integer :publisher_id,       null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end