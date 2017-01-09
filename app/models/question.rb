class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :possible_answers, :user_answers
end
