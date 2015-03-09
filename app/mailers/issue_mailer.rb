class IssueMailer < ActionMailer::Base
  default from: ENV['FROM_ADDRESS']

  def activation(issue)
    @issue = issue
    mail :to => @issue.email, :subject => "Confirm your issue on #{ENV['APP_TITLE']}"
  end

  def alert_admins(issue, service)
    @issue = issue
    @service = service
    @edit_service_url = "#{ENV['OHANA_API_URL']}/admin/organizations/#{service.organization.id}/services/#{service.id}/edit"
    mail :to => ENV['SITE_ADMIN_EMAIL'], :cc => service.admin_emails, :subject => "Issue flagged with service: #{service.name} on #{ENV['APP_TITLE']}"
  end
end
