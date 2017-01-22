class SurveysController < ApplicationController
  before_action :set_survey, except: [:index, :new, :create, :home, :mysurveys]
  before_action :authenticate_user!, except: [:index, :show]

  def home
  end

  def mysurveys
    @current_user = current_user
    @surveys = Survey.where(user_id: current_user.id)
  end

  def index
    @surveys = Survey.all.reject { |s| s.user_id == current_user.id }
  end

  def show
    if current_user.id == @survey.user_id
      render :mysurvey
    else
      redirect_to new_survey_submission_path
    end
    # @submission = Submission.new
  end

  def new
    @survey = Survey.new
    @survey.questions.build
    # @submission = Submission.new
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

  def edit
  end

  def update
    if @survey.update(survey_params)
      redirect_to @survey
      flash[:notice] = "Survey succesfully updated"
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    flash[:notice] = "Survey was deleted"
    redirect_to root_path
  end

  private

  def survey_params
    params[:survey].permit(:user_id, :title, questions_attributes: [:id, :prompt, :_destroy, answers_attributes: [:id, :content, :_destroy]])
  end

  def set_survey
    @survey = Survey.find(params[:id])
  end
end
