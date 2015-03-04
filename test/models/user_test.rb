# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  #http://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html
  self.use_instantiated_fixtures = true


  def setup
    @admin = users(:admin)
    @user = users(:not_admin)
  end
 
  
  test "a newly created user is not an admin" do
    assert_equal(false, @user.admin)
  end

  test "an newly created admin is an admin" do
    assert_equal(true, @admin.admin)
  end
  

  
end
