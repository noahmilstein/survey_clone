class Submission < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
end
