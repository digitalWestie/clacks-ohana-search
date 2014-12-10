class Issue < ActiveRecord::Base

  validate :service_id, :reason, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]
end
