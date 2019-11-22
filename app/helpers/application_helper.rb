module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "linh_son_food"
    page_title ? "#{page_title} | #{base_title}" : base_title
  end
end
