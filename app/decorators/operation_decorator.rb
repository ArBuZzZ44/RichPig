class OperationDecorator < ApplicationDecorator
  delegate_all

  def formatted_operation_date
    l operation_date, format: :long
  end
end