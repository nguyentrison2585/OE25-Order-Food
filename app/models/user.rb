class User < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy
end
