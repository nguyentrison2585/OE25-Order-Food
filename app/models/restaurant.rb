class Restaurant < ApplicationRecord
  has_one_attached :image
  has_many :dishes, dependent: :destroy
  has_many :combos, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :open_time, presence: true
end
