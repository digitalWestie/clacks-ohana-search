class Issue < ActiveRecord::Base

  validate :service_id, :reason, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]

  def keep_relevant(service)
    binding.pry
    if self.still_relevant?(service)
      return true
    else
      self.destroy
      return false
    end
  end

  def still_relevant?(service)
    service.update_at.to_i.to_s.eql?(self.service_timestamp)
  end

end
