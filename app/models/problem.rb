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
  has_many :submissions
  has_many :tests
  has_one :result
end
