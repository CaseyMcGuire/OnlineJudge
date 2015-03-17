class ResultsController < ApplicationController
  before_action :authenticate_admin!

  def index
    redirect_to tests_path
  end

  def edit
    @cur_result = Result.find(params[:id])
  end

  def update
    Result.find(params[:id]).update(
                                    :expected_result => params[:expected_result],
                                    :input => params[:input]
                                    )
    
    flash[:notice] = "Result successfully update."
    redirect_to tests_path
  end

  def new 
     if Result.exists?(:problem_id => params[:problem_id])
       redirect_to edit_result_path(Result.find_by problem_id: params[:problem_id])
     end
  end

  def create
    puts "==================="
    puts params
    puts"===================="
    Result.new(
              :problem_id => params[:problem_id],
               :expected_result => params[:expected_result],
               :input => params[:input]
               ).save
    flash[:notice] = "Result successfully created."
    redirect_to tests_path
  end

end
