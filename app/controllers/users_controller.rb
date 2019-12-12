class UsersController < ApplicationController
  before_action :load_user, only: %i(show update)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash.now[:success] = t "sign_up_successful"
      redirect_to root_url
    else
      flash.now[:warning] = t "fail_sign_up"
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t "user_updated"
    else
      flash[:danger] = t "user_update_fail"
    end
    @user.image.attach params[:user][:image] if params[:user][:image]
    redirect_to @user
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
