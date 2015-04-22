# == Schema Information
#
# Table name: submissions
#
#  id          :integer          not null, primary key
#  code        :text
#  language_id :integer
#  status_id   :integer
#  problem_id  :integer
#  user_id     :integer
#  completed   :boolean          default(FALSE), not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :problem
  belongs_to :language

  def passed?
    Status.find_by(id: self.status_id).try(:name) == "Success"
  end
end
