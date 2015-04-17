class ProblemsController < ApplicationController
 
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    #only select problems that have both a result and starter code 
    #in at least one language
    @problems = Problem.where(id: Test.select("problem_id")).joins(:result)
    
  end

  #show a specific problem
  def show
    #if there is a language and submission query string, that means the user
    #is trying to look at a past submission
      
    #if there are params but they aren't valid, just redirect to problem page
    if params_present? && !params_valid?
      redirect_to problem_path(params[:id])
    end
    
    #From here on, we know that if params are present, they are valid
    
    @problem = Problem.find(params[:id])
     
    @languages = Language.joins(test: :problem).where("problem_id = ?", params[:id])
    
    if params_present?
      @cur_language = @languages.find(params[:language_id])
    else
      @cur_language = @languages.last
    end

    result = Result.find_by_problem_id(params[:id])
    
    @sample_input = result.sample_input
    @sample_output = result.sample_output

    
    @tests = Test.where("problem_id=?", @problem.id)

    if params_present?
      
      submission = Submission.find(params[:submission_id])
      @beginning_code = submission.code

    else
      @beginning_code = Test.where(language_id: @cur_language.id, problem_id: params[:id]).first.starter_code
    end
    

    #puts "================"
    #puts @test
    #puts "================"
    #if the user is not signed in, we don't want
    #the submit button to be clickable
    if user_signed_in?
      @should_enable = ""
    else
      @should_enable = "disabled"
    end
  end

  def new
  end

  def create
    Problem.new(
                :name => params[:name],
                :description => params[:description]
              ).save
    flash[:notice] = "Problem successfully created"
    redirect_to problems_path
    
  end

  
  def edit
    @cur_problem = Problem.find(params[:id])
  end

  def update
  
    Problem.find(params[:id]).update(
                                  :name => params[:name],
                                  :description => params[:description]
                                  )

    flash[:notice] = "Problem successfully updated."
    redirect_to problems_path
  end

  def destroy
  end


  private
  def authenticate_admin
    authenticate_admin! {redirect_to root_path}
  end

  def params_present?
    params[:language_id] != nil && params[:submission_id] != nil
  end

  #Returns true if the query strings passed to the Problem Controller's show 
  #action are valid.
  def params_valid?
    
    #if the user isn't signed in or there aren't any parameters, the params 
    #aren't valid
    if !user_signed_in? || !params_present? 
      return false
    end
    
    #Check whether a submission for the given language exists and whether it
    #belongs to the current user.
    submission = Submission.where(id: params[:submission_id], language_id: params[:language_id])
    
    submission.present? && current_user.id == submission.first.user_id
  end

end
