class DashboardController < ApplicationController
  def show
    @user = current_user
    @user_properties = UserPropertiesFacade.new(@user.id).user_properties if @user.present?
    if @user.nil?
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end
    if params[:search_street] && params[:search_zip]
      # change to be if sad path, elsif saved, else search? 
      @property = SearchFacade.new(params[:search_street], params[:search_zip]).property
    #elsif params[:saved_street] && params[:saved_zip]
      # @property = SearchFacade.new()
    end
  end
end