class ProblemController < ApplicationController

#show all problems
def menu
  @problems = Problem.all
end


#show a specific problem
def problem
  @problem = Problem.find(params[:id])
end

end
