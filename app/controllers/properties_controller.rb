class PropertiesController < ApplicationController
  def show
    @user = current_user
    @user_properties = UserPropertiesFacade.new(@user.id).user_properties if @user.present?
    @property = SavedFacade.new(params[:user_id], params[:property_id]).property
  end
end
