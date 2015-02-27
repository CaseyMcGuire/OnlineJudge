class ProblemsController < ApplicationController
 # respond_to :html, :json, :js
 # layout "problem"
  #show all problems
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

  def check
    submission = Submission.find(params[:id])
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json { render json: {'submission' => submission} }
    end
  end

  def new
  end

  def update
  end

  def destroy
  end
  

end
