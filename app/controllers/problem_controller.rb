class ProblemController < ApplicationController
 # layout "problem"
  #show all problems
  def menu
    @problems = Problem.all
  end


  #show a specific problem
  def show
    @problem = Problem.find(params[:id])
  end

end
