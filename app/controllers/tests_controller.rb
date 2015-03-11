class TestsController < ApplicationController

  
  
  def index
    @test = Test.all
  end

  def new
    #need to get languages for given problem that don't have tests
  end
  
  def create
  end

  def edit
  end

  def create
  end
end
