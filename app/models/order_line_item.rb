class OrderLineItem < ApplicationRecord
  belongs_to :order, foreign_key: :order_id, optional: true
  belongs_to :product, foreign_key: :product_id, optional: true
end
