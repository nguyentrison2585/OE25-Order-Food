module DishesHelper
  def active_dishes_list restaurant
    "active" if correct_restaurant?(restaurant) && params[:action] == "index"
  end
end
