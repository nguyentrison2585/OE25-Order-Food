class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: %i(show edit update orders)

  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(distinct: true)
                     .page(params[:page]).per Settings.res_per_page
  end

  def show
    @q = @restaurant.dishes.ransack(params[:q])
    @dishes = @q.result(distinct: true)
                .page(params[:page]).per Settings.res_per_page
  end

  def edit; end

  def update
    if @restaurant.update restaurant_params
      attach_image
      flash[:success] = t "restaurant_updated"
    else
      flash[:danger] = t "restaurant_update_fail"
    end
    redirect_to edit_restaurant_url
  end

  def new
    @new_restaurant = current_user.restaurants.build
    respond_to :js
  end

  def create
    @new_restaurant = current_user.restaurants.build new_restaurant_params
    attach_image
    save_restaurant
  end

  def orders
    @order = @restaurant.orders.search(params[:q])
    @orders = @order.result(distinct: true)
                    .page(params[:page]).per Settings.order_page
  end

  private

  def load_restaurant
    @restaurant = Restaurant.find_by id: params[:id]
    return if @restaurant

    flash[:danger] = t "invalid_restaurant"
    redirect_to root_url
  end

  def restaurant_params
    params.require(:restaurant).permit Restaurant::RESTAURANT_PARAMS
  end

  def new_restaurant_params
    params.require(:new_restaurant).permit Restaurant::RESTAURANT_PARAMS
  end

  def save_restaurant
    if @new_restaurant.save
      flash[:success] = t "restaurant_created"
      redirect_to edit_restaurant_url @new_restaurant
    else
      flash[:danger] = t "restaurant_create_fail"
      redirect_to root_url
    end
  end

  def attach_new_image
    return unless params.dig(:new_restaurant, :image)

    @new_restaurant.image.attach params[:new_restaurant][:image]
  end

  def attach_image
    return unless params.dig(:restaurant, :image)

    @restaurant.image.attach params[:restaurant][:image]
  end
end
