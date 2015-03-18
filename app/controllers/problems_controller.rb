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
    @cur_language = @languages.last
    
       
    @tests = Test.where("problem_id=?", @problem.id)
    
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
