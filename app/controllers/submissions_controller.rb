class SubmissionsController < ApplicationController

 before_action :authenticate_user!, only: [:new, :check]

  def new
    problem = Problem.find(params[:id])
    language = (Language.find_by name: 'python')
    status = (Status.find_by name: 'Running')
    
    submission = Submission.create!(
                                    :code => params[:textarea],
                                    :language => language,
                                    :problem => problem,
                                    :user => current_user,
                                    :status => status
                                    )
    
    # incompletes = Submission.where(completed: false)

    respond_to do |format|
      format.html { redirect_to problem_path }
      format.js
      format.json { render json: {'text' => 'Running', 'submission' => submission}}
    end
  end

  def get
  end

  def update
  end

  
  def check
    submission = Submission.find(params[:id])
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json { render json: {'submission' => submission} }
    end
  end

  private
  def authenticate_admin
    redirect_to problems_path unless current_user.try(:admin)
  end
  
end
