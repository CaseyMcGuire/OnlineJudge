class TestsController < ApplicationController

  #need to authenticate admin
  before_action :authenticate_admin!  
  before_action :valid_params?, except: [:index, :edit]

  def index
    @languages = Language.all
    @problems = Problem.all


  end

  def new
    if test_exists?
      test = Test.find_by :language_id => params[:language_id], :problem_id => params[:problem_id]
      
      redirect_to edit_test_path(test)#(:problem_id => params[:problem_id], :language_id => params[:language_id])
    end
    @problem = Problem.find_by id: params[:problem_id]
    @language = Language.find_by id: params[:language_id]
  end
  
  def create
    if test_exists?
      redirect_to tests_path
    end
    puts "=================="
    puts params
    puts "================="
    test = Test.new(
                    :problem_id => params[:problem_id],
                    :language_id => params[:language_id],
                    :starter_code => params[:starter_code],
                    :test_code => params[:test_code]
                    )
    if test.save
      flash[:notice] = "Test created"
      redirect_to tests_path
    else
      flash[:notice] = "Test NOT created"
      redirect_to root_path
    end
  end

  def edit
    #if !test_exists?
     # redirect_to new_test_path(:problem_id => params[:problem_id], :language_id => params[:language_id])
    #end
    
    @test = Test.find(params[:id])
    puts "+=+=+=+=+=+=+=+=+"
    puts @test.starter_code
    puts "+=+=+=+=+=+=+=+=+"
    
    @problem = @test.problem
    @language = @test.language
    #puts "=================="
    #puts @test
    #puts @test.starter_code
    #puts "=================="

    

  end

  def update
    puts "in test update"
    puts "+++++++++++++++++"
    puts params
    puts "++++++++++++++++++"
    Test.find(params[:id]).update(
                                  :starter_code => params[:starter_code],
                                  :test_code => params[:test_code]
                                  )
   
    flash[:notice] = "Test updated"
    redirect_to tests_path
    
  end

  private

  def valid_params?
    puts "================"
    puts params
    puts '================'
    if params == nil || params[:problem_id] == nil || params[:language_id] == nil
      redirect_to tests_path
    elsif !Language.exists?(:id => params[:language_id])
      redirect_to tests_path
    elsif !Problem.exists?(:id => params[:problem_id])
      redirect_to tests_path
    end
  end
  
  def test_exists?
    Test.exists?(:problem_id => params[:problem_id], :language_id => params[:language_id])
  end


end
