# == Schema Information
#
# Table name: results
#
#  id              :integer          not null, primary key
#  problem_id      :integer
#  expected_result :text
#  input           :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Result < ActiveRecord::Base
  validates_uniqueness_of :problem_id
  belongs_to :problem
  
end
