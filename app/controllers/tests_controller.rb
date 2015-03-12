class TestsController < ApplicationController

  #need to authenticate admin
  before_action :authenticate_admin!  
  before_action :valid_params?, except: [:index]

  def index
    @languages = Language.all
    @problems = Problem.all
  end



  def new
    if test_exists?
      redirect_to edit_test_path(:problem_id => params[:problem_id], :language_id => params[:language_id])
    end

    @params = params
    
    @language = Language.find_by id: params[:language_id]
  end
  
  def create
    puts params
    redirect_to tests_path
  end

  def edit
    if !test_exists?
      redirect_to new_test_path(:problem_id => params[:problem_id], :language_id => params[:language_id])
    end
    @language = Language.find_by id: params[:language_id]
  end

  def update
  end

  private

  def valid_params?
    if params == nil || params[:problem_id] == nil || params[:language_id] == nil
      redirect_to tests_path
    elsif !Language.exists?(:id => params[:language_id])
      redirect_to tests_path
    elsif !Problem.exists?(:id => params[:problem_id])
      redirect_to tests_path
    end
  end
  
  def test_exists?
    Test.exists?(:problem_id => params[:problem_id], :language_id => params[:language_id])
  end

end
