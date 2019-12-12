module UsersHelper
  def image_path user
    if user.image.attached?
      user.image
    else
      "default_avatar.png"
    end
  end
end
