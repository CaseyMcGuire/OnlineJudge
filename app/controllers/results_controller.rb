class ResultsController < ApplicationController
  before_action :authenticate_admin!

  def index
    redirect_to tests_path
  end

  def edit
  end

  def update
  end

  def new 
  end

  def create
  end

end
