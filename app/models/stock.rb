class Stock < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :code
  belongs_to_active_hash :publisher
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :number, :name, :author, :stock, :genre_id, :code_id, :publisher_id,  presence: true
    validates :code_id, :publisher_id, :genre_id, numericality: { other_than: 1 }
  end
  
end
