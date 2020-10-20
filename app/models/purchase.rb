class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :stocks

  validates :quantity, presence: true
end
