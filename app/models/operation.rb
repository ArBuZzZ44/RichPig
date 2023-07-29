class Operation < ApplicationRecord
  belongs_to :wallet

	validates :operation_type, presence: true, inclusion: { in: %w(Expense Profit) }
	validates :operation_amount, presence: true, numeric: true
	validates :operation_date, presence: true
end
