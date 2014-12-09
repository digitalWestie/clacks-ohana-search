class Issue < ActiveRecord::Base

  validates :service_id, :reason, presence: true

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]
end
