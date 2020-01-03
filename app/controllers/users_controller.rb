class UsersController < ApplicationController
  before_action :load_user, only: %i(show update)

  def show; end

  def update
    @user.image.attach params[:user][:image] if params[:user][:image]
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "no_exist"
    redirect_to root_url
  end
end
