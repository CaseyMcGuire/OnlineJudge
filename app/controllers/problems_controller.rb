class ProblemsController < ApplicationController
 
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    #only select problems that have both a result and starter code 
    #in at least one language
    @problems = Problem.where(id: Test.select("problem_id")).joins(:result)
    
  end

  #show a specific problem
  def show
    
   
    
    @problem = Problem.find(params[:id])
    #should redirect here if teh user tries anything fishy
   
    @languages = Language.joins(test: :problem).where("problem_id = ?", params[:id])
    
    if params[:language_id] != nil && @languages.where(id: params[:language_id]).present?
      @cur_language = @languages.find(params[:language_id])
      
    else
      @cur_language = @languages.last
    end

    result = Result.find_by_problem_id(params[:id])
    
    @sample_input = result.sample_input
    @sample_output = result.sample_output

    
    @tests = Test.where("problem_id=?", @problem.id)

    if params[:submission_id] != nil
      #make sure this is the current user's submission
      submission = Submission.find(params[:submission_id])

      if submission.user_id != current_user.id
        redirect_to problem_path(params[:id])
      end
      
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

end
