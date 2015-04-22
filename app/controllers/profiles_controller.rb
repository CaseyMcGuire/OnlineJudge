class ProfilesController < ApplicationController
  
  def show
    if params[:id] == nil && current_user == nil
      redirect_to root_path
    elsif params[:id] == nil
      redirect_to profiles_path(current_user.id)
    end
    
    @user = User.find(params[:id])
    

  end

  private 
  def current_user_profile?
    params[:id] == nil || current_user.id == params[:id]
  end

end
