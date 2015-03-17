class ResultsController < ApplicationController
  before_action :authenticate_admin!

  def index
    redirect_to tests_path
  end

  def edit
       
  end

  def update
  end

  def new 
     if Result.exists?(:problem_id => params[:problem_id])
       redirect_to edit_result_path(Result.find_by problem_id: params[:problem_id])
     end
  end

  def create
  end

end
