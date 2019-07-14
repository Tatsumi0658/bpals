module ApplicationHelper
  def current_profile
    if current_user.nil? || Profile.find_by(user_id: current_user.id).nil?
      @current_profile = nil
    else
      @current_profile || Profile.find_by(user_id: current_user.id)
    end
  end
end
