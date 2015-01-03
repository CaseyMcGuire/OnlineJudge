class HomeController < ApplicationController

  def welcome
    @user = current_user
    puts Rails.configuration.database_configuration[Rails.env]
  end
end
