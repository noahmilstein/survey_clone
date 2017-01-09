class SurveysController < ApplicationController

  before_action :set_survey, except: [:index, :new]

  def index
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def create
  end

  private

  def survey_params
    params[:survey].permit(:user_id, :title)
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
