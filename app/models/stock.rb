class Stock < ApplicationRecord
  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :code
  belongs_to_active_hash :publisher
  belongs_to_active_hash :genre

  with_options presence: true do 
    validates :number, :stock, numericality: { with: /\A[0-9]+\z/ }
    validates :code_id, :publisher_id, :genre_id, numericality: { other_than: 1 }
  end
  
end
