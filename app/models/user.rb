class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :restaurant, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone_number, presence: true

  USER_PARAMS = %i(name email password password_confirmation phone_number).freeze

  enum role: {admin: 0, boss: 1, normal: 2}
  has_secure_password
end
