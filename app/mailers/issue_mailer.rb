class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']

  def activation(issue)
    @issue = issue
    mail :to => @issue.email, :subject => "Confirm your issue on Clackskids"
  end

  def alert_admins(issue, service)
    @issue = issue
    @service = service
    mail :to => ENV['SITE_ADMIN_EMAIL'], :bcc => service.admin_emails, :subject => "Issue flagged with service: #{service.name} on Clackskids"
  end
end
