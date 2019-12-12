class OrdersController < ApplicationController
  before_action :require_logged_in
  before_action :load_order, only: :destroy

  def index
    @orders = current_user.orders.by_created_at.page(params[:page]).per Settings.order_page
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new order_params
    if @order.save
      flash[:success] = t "order_successful"
      redirect_to history_order_path
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

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order

    flash[:danger] = t "not_found_order"
    redirect_to root_url
  end
end
