class UserPropertiesController < ApplicationController
  def create
    RentInformService.new.save_property(params[:user_id], params[:property_id])
    redirect_back_or_to dashboard_path
  end

  def destroy
    RentInformService.new.unsave_property(params[:user_id], params[:property_id])
    redirect_back_or_to dashboard_path
  end
end
