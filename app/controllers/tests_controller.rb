class TestsController < ApplicationController

  before_action :authenticate_admin
  
  def index
    @test = Test.all
  end
  
  def new
  end
  
  def create
  end
end
