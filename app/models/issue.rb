class Issue < ActiveRecord::Base

  validate :service_id, :reason, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  extend Enumerize
  enumerize :reason, in: [:outdated, :innacurate]

  after_create :set_activation

  def keep_relevant(service)
    if self.still_relevant?(service) and self.is_activated
      return true
    elsif self.still_relevant?(service) and self.created_at > 2.days.ago
      return false
    else
      self.destroy
      return false
    end
  end

  def still_relevant?(service)
    service.updated_at.to_i.to_s.eql?(self.service_timestamp)
  end

  private

  def set_activation
    self.update_attribute(:activation, SecureRandom.uuid)
  end

end
