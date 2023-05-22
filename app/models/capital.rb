class Capital < ApplicationRecord
  validates :goal, presence: true, length: { minimum: 3 }
  validates :amount, presence: true
  validates :period, presence: true
end

