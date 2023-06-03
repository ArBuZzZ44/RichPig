class Addition < ApplicationRecord
  belongs_to :capital

  validates :balance, presence: true, numeric: true
end
