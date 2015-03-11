class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #  before_action :authenticate_user!
  
  helper_method :all
  
 def not_found
   render :text => '404: Not Found', :status => '404'
 end

 def authenticate_admin!
   current_user.try(:admin) or not_found 
 end

end
