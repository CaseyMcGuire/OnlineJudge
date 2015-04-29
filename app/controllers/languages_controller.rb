class LanguagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @languages = Language.all
  end

  def create
    Language.new(:name => params[:language_name].downcase).save
    flash[:update] = "New language saved"
    redirect_to faq_path
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
  end

  def destroy
  end

  #if the user decides to change the language they're using
  #needs to respond with json
  def show
    language = (Language.find_by id: params[:language_id])
    #Need to get starter code as well
    respond_to do |format|
      format.html {redirect_to problem_path}
      format.json {render json: language }
    end
  end
end
