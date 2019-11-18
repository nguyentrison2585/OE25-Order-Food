class Combo < ApplicationRecord
  belongs_to :restaurant
  has_many :combo_details, dependent: :destroy
  has_many :dishs, through: :combo_details, dependent: :destroy
  has_many :order_details, as: :order_detailable, dependent: :destroy
end
