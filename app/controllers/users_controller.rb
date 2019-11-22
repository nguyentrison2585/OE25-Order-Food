class UsersController < ApplicationController
  before_action :load_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success]= t "sign_up_successfull"
      redirect_to @user
    else
      render :new
    end
  end

  def show
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
