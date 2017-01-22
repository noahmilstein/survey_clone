class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, inverse_of: :survey
  has_many :answers

  has_many :submissions
  has_many :users, through: :submissions

  # has_many :answers, though: :questions
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: proc { |attributes| attributes[:prompt].blank? }

  def questions_for_form
    collection = questions.where(survey_id: id)
    collection.any? ? collection : questions.build
  end
end
