class Order < ApplicationRecord
  ORDER_PARAMS = [:address, :total_money, :user_id, :restaurant_id,
                    order_details_attributes: [:order_detailable_type,
                      :order_detailable_id, :count, :amount]].freeze

  enum status: {pending: 0, accepted: 1, cancel: 2}

  belongs_to :user
  belongs_to :restaurant

  has_many :order_details, dependent: :destroy

  validates :address, :total_money, presence: true

  accepts_nested_attributes_for :order_details

  scope :by_created_at, ->{order created_at: :desc}

  delegate :name, to: :restaurant, prefix: true
  delegate :name, to: :user, prefix: true
end
