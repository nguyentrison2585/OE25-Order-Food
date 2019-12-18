class StaticPagesController < ApplicationController
  def home
    @restaurants = Restaurant.with_attached_image
                             .page(params[:page]).per Settings.res_per_page
  end

  def about; end

  def contact; end

  def term; end

  def security; end
end
