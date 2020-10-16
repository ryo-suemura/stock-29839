class Stock < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :code
  belongs_to_active_hash :publisher
end
