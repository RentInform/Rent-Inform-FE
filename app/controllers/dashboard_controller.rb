class DashboardController < ApplicationController
  def show
    @user = current_user
    @user_properties = UserPropertiesFacade.new(@user.id).user_properties if @user.present?

    if @user.nil?
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end

    if params[:user_id] && params[:property_id]
      @property = SavedFacade.new(params[:user_id], params[:property_id]).property
    end

    if params[:search_street] && params[:search_zip]
      @property = SearchFacade.new(params[:search_street], params[:search_zip]).property
    end
  end
end
