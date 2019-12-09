class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :combo_details, dependent: :destroy
  has_many :combos, through: :combo_details, dependent: :destroy
  has_many :order_details, as: :order_detailable, dependent: :destroy
  validates :name, :description, :price, presence: true
  has_one_attached :image
end
