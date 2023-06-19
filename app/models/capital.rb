class Capital < ApplicationRecord
  has_many :additions, dependent: :destroy

  validates :goal, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numeric: true
  validates :period, presence: true, numeric: { message: "should be equal to the number of months"}
end

