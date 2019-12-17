class OrderDetailsController < ApplicationController
  before_action :load_order, only: :index

  def index
    @order_details = @order.order_details.page(params[:page]).per Settings.order_page
  end

  def show; end

  private

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order

    flash[:danger] = t "not_found_order"
    redirect_to root_url
  end
end
