class TestsController < ApplicationController

  before_action :authenticate_admin
  
  def index
    @test = Test.all
  end
  
<<<<<<< HEAD
  def new   
=======
  def new
>>>>>>> 08e184e763e0ffbbb859e17367eadf8a1cb7ee98
  end
  
  def create
  end
end
