class OrdersController < ApplicationController
  before_action :require_logged_in

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new order_params
    if @order.save
      flash[:success] = t "order_successful"
      redirect_to root_path
    else
      flash[:warning] = t "order_not_successful"
      render :new
    end
  end

  def show; end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end
end
