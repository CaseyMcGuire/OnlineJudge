class SubmissionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :check, :index]
  protect_from_forgery except: :update

  def index
    if params[:id] != nil
      @submissions = Submission.where(problem_id: params[:id], user_id: current_user.id).order(created_at: :desc)
    else
      @submissions = Submission.where(user_id: current_user.id).order(created_at: :desc)
    end
  end

  def show
  end


  def create
    #puts params
    
    problem = Problem.find(params[:problem_id])
    language = (Language.find_by name: params[:language])
    status = (Status.find_by name: 'Pending')
    
    submission = Submission.create!(
                                    :code => params[:textarea],
                                    :language => language,
                                    :problem => problem,
                                    :user => current_user,
                                    :status => status
                                    )
    
    #should probably make a post request here.
    # incompletes = Submission.where(completed: false)

    respond_to do |format|
      format.html { redirect_to problem_path }
      format.js
      format.json { render json: {'text' => 'Running', 'submission' => submission} }
    end
  end


  #returns *any* ungraded submission
  def get_ungraded

    #need to add some sort of status that says that submission is being graded

    if Submission.exists?(:completed => false)
      incomplete = Submission.where(completed: false).first
      puts "======================"
      puts incomplete
      puts "===================="
      result = Result.where(problem_id: incomplete.problem.id).first
      
      to_return = {
        submission_id: incomplete.id,
        code: incomplete.code,
        language: incomplete.language.name,
        test_code: Test.where(language_id: incomplete.language.id, problem_id: incomplete.problem.id)[0].test_code,
        input: result.input,
        output: result.expected_result
      }.to_json
    else
      to_return = {}
    end
    
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: to_return}

     # format.json { render json: incompletes, :include => :problem}
    #  format.json { render json: {'submission' => incompletes}}
    end
  end

  #updates the status of the submission OR allows user to save submission
  def update
    puts '======================================'
    puts 'HELLO WORLD'
    puts params
   # puts params[:result].squish.eql? "PASS"
    puts '======================================'
    submission =  Submission.find(params[:id])#where(id: params[:id])
    submission.completed = true
    if params[:result] != nil && params[:result].eql?(0)
      submission.status = Status.find_by(name: "Success")
    else
      submission.status = Status.find_by(name: "Failure")
    end
    submission.save
    puts submission.completed
    puts submission
    puts "--------------------------------------"

    respond_to do |format|
      format.json {render json: {status:"OK"}.to_json }
    end
  end

  #allow user to save current submission to file system
  def save
  end

  #Want to check on *specific* submission
  def check
    submission = Submission.find(params[:id])
   
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json { render json: {completed: submission.completed, result: submission.status.try(:name)}.to_json }
    end
  end

  private
  def authenticate_admin
    authenticate_admin! {redirect_to root_path}
  end
  
end
