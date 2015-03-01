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

require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase

end
