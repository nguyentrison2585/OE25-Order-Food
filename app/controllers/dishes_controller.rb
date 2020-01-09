class DishesController < ApplicationController
  before_action :load_restaurant, only: %i(index update)
  before_action :load_dish, only: %i(edit update)

  def index
    @dishes = @restaurant.dishes.page(params[:page]).per Settings.dish_per_page
  end

  def edit
    respond_to :js
  end

  def update
    if @dish.update dish_params
      attach_image
      flash[:success] = t "dish_updated"
    else
      flash[:danger] = t "dish_update_fail"
    end
    redirect_to dishes_url(res_id: @restaurant.id)
  end

  private

  def dish_params
    params.require(:dish).permit Dish::DISH_PARAMS
  end

  def load_dish
    @dish = Dish.find_by id: params[:id]
    return if @dish

    flash[:danger] = t "not_exist"
    redirect_to root_url
  end

  def attach_image
    return unless params.dig(:dish, :image)

    @dish.image.attach params[:dish][:image]
  end

  def load_restaurant
    @restaurant = Restaurant.find_by id: params[:res_id]
    return if @restaurant

    flash[:danger] = t "not_exist"
    redirect_to root_url
  end
end
