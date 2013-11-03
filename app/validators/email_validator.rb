class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && !(value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
      record.errors[attribute] << (options[:message] || 'is invalid')
    end
  end
end
