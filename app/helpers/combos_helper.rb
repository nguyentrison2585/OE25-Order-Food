module CombosHelper
  def active_combos_list restaurant
    "active" if correct_restaurant?(restaurant) && combos_controller?
  end

  def combos_controller?
    params[:controller] == "combos" && params[:action] == "index"
  end
end
