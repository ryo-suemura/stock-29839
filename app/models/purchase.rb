class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :quantity, presence: true
end
