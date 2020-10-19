class Purchase < ApplicationRecord
  belong_to :user
  has_many :stocks
end
