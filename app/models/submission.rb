class Submission < ActiveRecord::Base
  belongs_to :user

  #These I'm not sure about
  belongs_to :status
  belongs_to :problem
  belongs_to :language
end
