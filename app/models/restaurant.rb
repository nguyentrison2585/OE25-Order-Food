class Restaurant < ApplicationRecord
  RESTAURANT_PARAMS = %i(name address phone_number open_time).freeze

  belongs_to :user
  has_many :dishes, dependent: :destroy
  has_many :combos, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :open_time, presence: true

  scope :search, (lambda do |search_key|
    where("name LIKE ? or address LIKE ?", "%#{search_key}%", "%#{search_key}%")
  end)
end
