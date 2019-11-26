class Order < ApplicationRecord
  belongs_to :user
  validates :address, :date_time, :is_complete, :total_money, presence: true
end
