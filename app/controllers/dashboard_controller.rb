class DashboardController < ApplicationController
  def show
    @user = current_user
    if @user.nil?
      redirect_to root_path
      flash[:error] = "You must be logged in to view this page"
    end
    if params[:search_street] && params[:search_zip]
      @property = SearchFacade.new(params[:search_street], params[:search_zip]).property
    end
  end
end