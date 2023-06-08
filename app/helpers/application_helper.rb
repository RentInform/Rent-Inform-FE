module ApplicationHelper
  def prop_ids(user_properties)
    user_properties.map(&:id)
  end
end
