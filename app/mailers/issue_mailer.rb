class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']

  def activation(issue)
    @issue = issue
    mail :to => @issue.email, :subject => "Confirm your issue on Clackskids"
  end
end
