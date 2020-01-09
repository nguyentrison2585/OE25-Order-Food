module DishesHelper
  def active_dishes_list restaurant
    "active" if correct_restaurant?(restaurant) && dishes_controller?
  end

  def dishes_controller?
    params[:controller] == "dishes" && params[:action] == "index"
  end
end
