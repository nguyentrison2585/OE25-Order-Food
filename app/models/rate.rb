class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :point, presence: true
end
