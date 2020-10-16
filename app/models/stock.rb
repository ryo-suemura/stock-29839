class Stock < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :code
  belongs_to_active_hash :publisher

  with_options presence: true do
    validates :name, :author, :publish_day, :stock, :genre, :code_id, :publisher_id, :condition, presence: true
    validates :code_id, :publisher_id, numericality: { other_than: 1 }
  end
  
end
