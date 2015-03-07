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

  #returns *any* ungraded submission
  def get_ungraded
            
    incomplete = Submission.where(completed: false).first

    #This is okay for now.. Will need to do some error checking at some point
    
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json do
        render json: {
          problem: incomplete.problem,
          submission: incomplete,
          language: incomplete.language
        }.to_json
      end
     # format.json { render json: incompletes, :include => :problem}
    #  format.json { render json: {'submission' => incompletes}}
    end
  end

  #updates the status of the submission
  def update
    puts '==================='
    puts 'HELLO WORLD'
    puts '==================='
  end

  #Want to check on *specific* submission
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
