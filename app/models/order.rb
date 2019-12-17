class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  validates :address, :total_money, presence: true

  accepts_nested_attributes_for :order_details
  enum status: {pending: 0, accepted: 1, cancel: 2}

  ORDER_PARAMS = [:address, :total_money, :user_id,
                    order_details_attributes: [:order_detailable_type,
                      :order_detailable_id, :count, :amount]].freeze

  scope :by_created_at, ->{order created_at: :desc}
end
