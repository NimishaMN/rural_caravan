class Order < ApplicationRecord
	STATUS = {paid: 1, unpaid: 0}
	has_many :order_line_items, dependent: :destroy
	belongs_to :customer, foreign_key: :customer_id, optional: true

	# validates_presence_of :order_number, :order_date
	# validates_uniqueness_of :order_number
	# validates_presence_of :order_line_items
	# validates_associated :order_line_items, :message => "fields with * are mandatory"
end
