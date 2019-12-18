class OrdersController < ApplicationController
  before_action :require_logged_in
  before_action :load_order, only: :update
  before_action :is_boss?, only: :show

  def index
    @orders = current_user.orders.by_created_at
                          .page(params[:page]).per Settings.order_page
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new order_params
    if @order.save
      flash[:success] = t "order_successful"
      redirect_to orders_path
    else
      flash[:warning] = t "order_not_successful"
      render :new
    end
  end

  def update
    if @order.update(status: params[:status].to_i)
      flash[:success] = t "update_successfully"
      respond_to :js
    else
      flash[:warning] = t "update_not_successfully"
      redirect_to root_url
    end
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order

    flash[:danger] = t "not_found_order"
    redirect_to root_url
  end

  def load_restaurant
    @restaurant = current_user.restaurants.find_by id: params[:id]
    return if @restaurant

    flash[:danger] = t "not_found_restaurant"
    redirect_to root_url
  end

  def is_boss?
    redirect_to(root_url) unless current_user.boss?
  end
end
