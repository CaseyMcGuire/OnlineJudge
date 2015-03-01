class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
  
  #helper_method :authenticate_admin


  private

  def authenticate_admin
    current_user.try(:admin?)
  end

end
