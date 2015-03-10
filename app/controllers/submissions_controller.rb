class SubmissionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :check]

  def index
  end

  def show
  end

  def create
    puts params
    problem = Problem.find(params[:problem_id])
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
      format.json { render json: {'text' => 'Running', 'submission' => submission} }
    end
  end


  #returns *any* ungraded submission
  def get_ungraded
            
    incomplete = Submission.where(completed: false).first

    to_return = {
      submission_id: incomplete.id,
      code: incomplete.code,
      language: incomplete.language.name
    }.to_json
    
    
    respond_to do |format|
      format.html { redirect_to root_path}
      format.json {render json: to_return}

     # format.json { render json: incompletes, :include => :problem}
    #  format.json { render json: {'submission' => incompletes}}
    end
  end

  #updates the status of the submission OR allows user to save submission
  def update
    puts '==================='
    puts 'HELLO WORLD'
    puts params
    puts '==================='
  end

  #allow user to save current submission to file system
  def save
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
