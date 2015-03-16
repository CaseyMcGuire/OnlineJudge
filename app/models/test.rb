# == Schema Information
#
# Table name: tests
#
#  id           :integer          not null, primary key
#  starter_code :text
#  test_code    :text
#  problem_id   :integer
#  language_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Test < ActiveRecord::Base
  belongs_to :problem
  belongs_to :language
 # before_create :test_exists?
  #There needs to be a validation here
end
