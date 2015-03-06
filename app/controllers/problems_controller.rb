class ProblemsController < ApplicationController
 # respond_to :html, :json, :js
 # layout "problem"
  #show all problems

  before_action :authenticate_user!, only: [:evaluate, :check]
  before_action :authenticate_admin, only: [:new, :update, :destroy]

  def menu
    @problems = Problem.all
  end

  #show a specific problem
  def show
    @problem = Problem.find(params[:id])
    @languages = Language.all

    #if the user is not signed in, we don't want
    #the submit button to be clickable
    if user_signed_in?
      @should_enable = ""
    else
      @should_enable = "disabled"
    end
  end

  def new
  end

  def update
  end

  def destroy
  end

  private
  def authenticate_admin
    redirect_to problems_path unless current_user.try(:admin)
  end

end
