class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']

  def activation(issue)
    @issue = issue
    mail :to => @issue.email, :subject => "Confirm your issue on #{ENV['APP_TITLE']}"
  end

  def alert_admins(issue, service)
    @issue = issue
    @service = service
    mail :to => ENV['SITE_ADMIN_EMAIL'], :cc => service.admin_emails, :subject => "Issue flagged with service: #{service.name} on #{ENV['APP_TITLE']}"
  end
end
