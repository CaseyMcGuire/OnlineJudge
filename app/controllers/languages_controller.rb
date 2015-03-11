class LanguagesController < ApplicationController


  def new
  end

  #if the user decides to change the language they're using
  #needs to respond with json
  def show
    language = (Language.find_by name: params[:language])
    #Need to get starter code as well
    respond_to do |format|
      format.html { redirect_to problem_path}
      format.json {render json: {'language' => language} }
    end
  end
end
