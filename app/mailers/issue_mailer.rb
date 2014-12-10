class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']

  def activation(issue)
    @issue = issue
    mail :to => @issue.email, :subject => "Confirm your issue on Clackskids"
  end

  def alert_admins(issue, service)
    mail :to => service.organisation.issue_emails, :bcc => ENV['SITE_ADMIN'], :subject => "Issue flagged with service: #{service.name} on Clackskids"
  end
end
