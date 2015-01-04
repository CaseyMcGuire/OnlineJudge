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
   
    @problem = Problem.find(params[:id])
   # File.write('/Users/CaseyMcGuire/Desktop/CS440Project/testfiles/python/test.py', params[:textarea])
    
   # result = (`python ./testfiles/python/test.py`)
   # puts result
    
    language = Language.find_by_name('python')
   


    my_json = { 'text' => 'Running...'}
    #save code to file
    #run code 
    #send code back
    respond_to do |format|
      format.html { redirect_to problem_path }
      format.js
      format.json { render json: {'text' => 'Running...'}
    end
  end

  def check
  end

end
