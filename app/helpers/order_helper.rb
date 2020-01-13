module OrderHelper
  def order_status
    Order.statuses.map{|key, value| [key, value]}
  end

  def select_option_status_order
    params.dig(:q, :status_cont)
  end
end
