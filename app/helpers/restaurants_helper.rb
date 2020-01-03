module RestaurantsHelper
  def show_sub_navigation restaurant
    "show" if correct_restaurant?(restaurant)
  end

  def active_navigation restaurant
    "active" if correct_restaurant?(restaurant)
  end

  def active_update_restaurant restaurant
    "active" if correct_restaurant?(restaurant) && params[:action] == "edit"
  end

  def active_orders_list restaurant
    "active" if correct_restaurant?(restaurant) && params[:action] == "orders"
  end
end
