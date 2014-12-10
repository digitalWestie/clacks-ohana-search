class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']


end
