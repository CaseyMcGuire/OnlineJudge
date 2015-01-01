class ProblemsController < ApplicationController
 # respond_to :html, :json, :js
 # layout "problem"
  #show all problems
  def menu
    @problems = Problem.all
  end


  #show a specific problem
  def show
    @problem = Problem.find(params[:id])

    #if the user is not signed in, we don't want
    #the submit button to be clickable
    if user_signed_in?
      @should_enable = ""
    else
      @should_enable = "disabled"
    end
  end

  #POST evaluate/:id
  def evaluate
    puts params[:text]
    @problem = Problem.find(params[:id])
    respond_to do |format|
      format.html { redirect_to problem_path }
      format.js
      format.json { render json: params[:id]}
    end
    # redirect_to problem_path
   
  end

end
