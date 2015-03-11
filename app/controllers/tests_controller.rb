class TestsController < ApplicationController

  #need to authenticate admin
  
  def index
    @test = Test.all
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
