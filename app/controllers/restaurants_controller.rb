class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: :show

  def index
    if params[:search_key].blank?
      @restaurants = Restaurant.page(params[:page]).per Settings.res_per_page
    else
      @restaurants = Restaurant.search(params[:search_key]).page(params[:page])
                             .per Settings.res_per_page
    end
  end

  def show
    @dishes = @restaurant.dishes
  end

  def new; end

  private

  def load_restaurant
    @restaurant = Restaurant.find_by id: params[:id]
    return if @restaurant

    flash[:danger] = t "invalid_restaurant"
    redirect_to root_url
  end
end
