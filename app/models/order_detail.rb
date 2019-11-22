class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :order_detailable, polymorphic: true
  validates :order_detailable_id, :order_detailable_type, presence: true
end
