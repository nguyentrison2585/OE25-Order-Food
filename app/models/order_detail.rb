class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :order_detailable, polymorphic: true
end
