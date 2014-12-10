class IssuesController < ApplicationController

  def create
    issue = Issue.new(issue_params)
    issue.service_id = params[:service_id]
    if issue.save
      #send an email
      notice = "Your issue has been noted."
    else
      notice = "Your issue couldn't be saved, please try again!"
    end
    redirect_to service_path(issue.service_id), notice: notice
  end

  private

  def issue_params
    params.require(:issue).permit(:reason, :description, :service_timestamp, :email)
  end

end
