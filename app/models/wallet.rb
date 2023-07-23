class Wallet < ApplicationRecord
  has_many :profits, dependent: :destroy
  has_many :payments, dependent: :destroy

	validates :budget, presence: true, numeric: true
	validates :start_date, presence: true
	validates :end_date, presence: true, comparison: {greater_than: :start_date}
end