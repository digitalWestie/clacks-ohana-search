class IssuesController < ApplicationController

  def create
    issue = Issue.new(issue_params)
    issue.service_id = params[:service_id]
    if issue.save
      IssueMailer.activation(issue).deliver
      notice = "An email has been sent to #{issue.email}, please check it to confirm this issue."
    else
      notice = "Your issue couldn't be recorded, please try again!"
    end
    redirect_to service_path(issue.service_id), notice: notice
  end

  def activate
    issue = Issue.find_by(activation: params[:activation])
    if issue and issue.update_attributes(is_activated: true, activation: Time.now.to_i)
      service = Service.get(issue.service_id)
      IssueMailer.alert_admins(issue, service).deliver
      notice = "Your issue has been noted and our admins contacted, thank you for your help!"
    else
      notice = "Your issue couldn't be handled, please try again!"
    end
    redirect_to root_path, notice: notice
  end

  private

  def issue_params
    params.require(:issue).permit(:reason, :description, :service_timestamp, :email)
  end

end
