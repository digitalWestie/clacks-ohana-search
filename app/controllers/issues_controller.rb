class IssuesController < ApplicationController

  def create
    issue = Issue.new(params[:issue])
    issue.service_id = params[:service_id]
    if issue.save
      notice = "Your issue has been noted."
    else
      notice = "Your issue couldn't be saved, please try again!"
    end
    redirect_to service_path(issue.service_id), notice: notice
  end

end
