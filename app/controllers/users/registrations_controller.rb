class Users::RegistrationsController < Devise::RegistrationsController
  after_action :attach_image, only: :create

  def create
    super
  end

  protected

  def update_resource resource, params
    if params[:current_password].blank?
      params.delete "current_password"
      resource.update_without_password params
    else
      super
    end
  end

  private

  def attach_image
    @user.image.attach(io: File.open(Rails.root
        .join(Settings.default_avatar_path.join("/"))),
        filename: "default_avatar.png")
  end
end
