class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Issue < ActiveRecord::Base

  validates :service_id, :reason, presence: true
  validates :email, presence: true, email: true

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]
end
