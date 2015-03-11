class TestsController < ApplicationController

  #need to authenticate admin
  before_action :authenticate_user!  

  def index
    @languages = Language.all
    @problems = Problem.all
    
    #what percentage of a bootstrap row should each language take up
    #plus one for problem name
    @row_space = 12/(@languages.count + 1)
  end

  def new
    #if there are no parameters, we don't know which problem and
    #which language we're creating so redirect
    if params == nil || params[:problem_id] == nil || params[:language_id] == nil
      redirect_to problems_path
    end
    
  end
  
  def create
    #need to ensure a record with same problem_id and language_id doesn't already exist
  end

  def edit
  end

  def update
  end
end
