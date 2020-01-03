module ApplicationHelper
  def full_title page_title
    base_title = t "app_name"
    page_title ? "#{page_title} | #{base_title}" : base_title
  end

  def page_index params_page, index, per_page
    params_page ||= 1
    (params_page.to_i - 1) * per_page + index + 1
  end

  def correct_restaurant? restaurant
    @restaurant&.id == restaurant.id
  end
end
