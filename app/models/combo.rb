class Combo < ApplicationRecord
  COMBO_PARAMS = [:name, :description, :image, :price,
                    combo_details_attributes: [:dish_id, :count]].freeze

  belongs_to :restaurant

  has_many :combo_details, dependent: :destroy
  has_many :dishes, through: :combo_details, dependent: :destroy
  has_many :order_details, as: :order_detailable, dependent: :destroy
  has_many :orders, through: :order_details, dependent: :destroy
  has_one_attached :image

  validates :name, :description, presence: true

  accepts_nested_attributes_for :combo_details, allow_destroy: true
end
