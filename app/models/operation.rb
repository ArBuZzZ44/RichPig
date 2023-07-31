class Operation < ApplicationRecord
  belongs_to :wallet

	validates :operation_type, presence: true, inclusion: { in: %w(Expense Profit) }
	validates :operation_amount, presence: true, numeric: true
	validates :operation_date, presence: true

	def self.filter_operations(filter)
		if filter == "Profit"
			where(operation_type: "Profit")
		elsif	filter == "Expense"
			where(operation_type: "Expense")
		else
			all
		end
	end
end
