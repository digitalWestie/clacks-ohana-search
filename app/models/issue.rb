class Issue < ActiveRecord::Base

  attr_accessible :reason, :description, :service_id, :service_timestamp

  validates :service_id, :reason, presence: true

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]
end
