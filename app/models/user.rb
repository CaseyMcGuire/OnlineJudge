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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #ensures user enters a correct password and its encrypted before being saved.
  :registerable, #allows users to register themselves, and subsequently change their login credentials
  :recoverable, #for handling forgotten password safely
  :rememberable, #for transparently loggin on a user, based on a cookie.
  :trackable, #stores login information
  :validatable #ensures that given email/name and password conform to a particular format

  has_many :submissions, dependent: :destroy
end
