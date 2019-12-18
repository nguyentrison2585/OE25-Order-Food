class Dish < ApplicationRecord
  DISH_PARAMS = %i(name price description).freeze

  belongs_to :restaurant

  has_many :combo_details, dependent: :destroy
  has_many :combos, through: :combo_details, dependent: :destroy
  has_many :order_details, as: :order_detailable, dependent: :destroy
  has_many :orders, through: :order_details, dependent: :destroy
  has_one_attached :image

  validates :name, :description, :price, presence: true
end
