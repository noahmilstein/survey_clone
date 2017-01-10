class SurveysController < ApplicationController

  before_action :set_survey, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    if @survey.save
      redirect_to @survey
      flash[:success] = "Survey successfully created!"
    else 
      @survey.errors.any?
      flash[:notice] = @survey.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def survey_params
    params[:survey].permit(:user_id, :title)
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
