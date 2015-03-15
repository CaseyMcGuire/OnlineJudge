class HomeController < ApplicationController

  def welcome
    @user = current_user
  end

  def about
  end

  def faq
  end

  def error
  end

  
end
