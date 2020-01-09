class CombosController < ApplicationController
  before_action :load_restaurant, only: %i(new create index update)
  before_action :load_combo, only: %i(edit update)

  def index
    @combos = @restaurant.combos.page(params[:page]).per Settings.combo_per_page
    @dishes = @restaurant.dishes.page(params[:page])
  end

  def new
    @combo = @restaurant.combos.build
    respond_to :js
  end

  def create
    @combo = @restaurant.combos.build combo_params
    attach_image
    save_combo
  end

  def edit
    respond_to :js
  end

  def update
    @combo.combo_details.destroy_all
    if @combo.update combo_params
      attach_image
      flash[:success] = t "combo_updated"
    else
      flash[:danger] = t "combo_update_fail"
    end
    redirect_to combos_url(res_id: @restaurant.id)
  end

  private

  def combo_params
    params.require(:combo).permit Combo::COMBO_PARAMS
  end

  def load_combo
    @combo = Combo.find_by id: params[:id]
    return if @combo

    flash[:danger] = t "not_exist"
    redirect_to root_url
  end

  def save_combo
    if @combo.save
      flash[:success] = t "combo_created"
      redirect_to combos_url(res_id: @restaurant.id)
    else
      flash[:danger] = t "combo_create_fail"
      redirect_to root_url
    end
  end

  def attach_image
    return unless params.dig(:combo, :image)

    @combo.image.attach params[:combo][:image]
  end

  def load_restaurant
    @restaurant = Restaurant.find_by id: params[:res_id]
    return if @restaurant

    flash[:danger] = t "not_exist"
    redirect_to root_url
  end
end
