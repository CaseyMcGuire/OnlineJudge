class HomeController < ApplicationController

  def welcome
    @user = current_user
  end

  def about
  end

  def faq
    @languages = Language.all
  end

  def error
  end

  
end
