class Wallet < ApplicationRecord
	include Authorship
  has_many :operations, dependent: :destroy
	belongs_to :user

	validates :budget, presence: true, numeric: true
	validates :start_date, presence: true
	validates :end_date, presence: true, comparison: {greater_than: :start_date}
end