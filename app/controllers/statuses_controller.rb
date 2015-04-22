class StatusesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @statuses = Status.all
  end

  def new
  end
  
  def create
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
