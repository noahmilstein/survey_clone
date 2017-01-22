class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create

  end

  private

  def submission_params
    params[:submission].permit(:survey_id, :user_id)
  end
end
