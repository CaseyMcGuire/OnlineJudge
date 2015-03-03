class ProblemsController < ApplicationController
 # respond_to :html, :json, :js
 # layout "problem"
  #show all problems

  before_action :authenticate_user!, only: [:evaluate, :check]
  before_action :authenticate_admin, only: [:new, :update, :destroy]

  def menu
    @problems = Problem.all
  end

  #show a specific problem
  def show
    @problem = Problem.find(params[:id])

    #if the user is not signed in, we don't want
    #the submit button to be clickable
    if user_signed_in?
      @should_enable = ""
    else
      @should_enable = "disabled"
    end
  end

  #POST evaluate/:id
  def evaluate
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

    incompletes = Submission.where(completed: false)

    respond_to do |format|
      format.html { redirect_to problem_path }
      format.js
      format.json { render json: {'text' => 'Running', 'submission' => submission}}
    end
  end

  #POSt check/:id
  def check
    submission = Submission.find(params[:id])
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json { render json: {'submission' => submission} }
    end
  end


  #if the user decides to change the language they're using
  #needs to respond with json
  def get_new_language
    language = (Language.find_by name: params[:language])
    #Need to get starter code as well
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json {render json: {'language' => language} }
    end
  end

  def new
  end

  def update
  end

  def destroy
  end

  private
  def authenticate_admin
    redirect_to problems_path unless current_user.try(:admin)
  end

end
