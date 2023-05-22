class NumericValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      number = value.to_i
      if number <= 0
        record.errors.add(attribute, (options[:message] || "must be a positive"))
      end
    end
  end
end