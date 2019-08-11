module ApplicationHelper
  def current_profile
    if current_user.nil? || Profile.find_by(user_id: current_user.id).nil?
      @current_profile = nil
    else
      @current_profile || Profile.find_by(user_id: current_user.id)
    end
  end

  def default_meta_tags
    {
      site: 'B-PALs',
      reverse: true,
      canonical: request.original_url,
      separator: "|"
    }
  end

  def image_check(image)
    if image.present?
      image
    else
      "/public/icon.png"
    end
  end
end
