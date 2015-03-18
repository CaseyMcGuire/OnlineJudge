# == Schema Information
#
# Table name: problems
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Problem < ActiveRecord::Base
  has_many :submission
  has_many :test
  has_one :result, dependent: :destroy

  def test_exists
    Test.exists?(:problem_id)
  end
end
