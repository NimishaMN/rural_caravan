class Order < ApplicationRecord
	enum status: {Assigned: 1 , Open: 0, Completed: 2}
	# STATUS = {'0' => "Open", '1' => "Assigned", '2' => "Completed"}
	has_many :order_line_items, dependent: :destroy
	belongs_to :customer, foreign_key: :customer_id, optional: true
	accepts_nested_attributes_for :order_line_items

	# validates_presence_of :order_number, :order_date
	# validates_uniqueness_of :order_number
	# validates_presence_of :order_line_items
	# validates_associated :order_line_items, :message => "fields with * are mandatory"

	def self.new_orders(params)
		order = Order.new
		# order.order_number = params[:order_number]
		# order.record_date = params[:record_date]
		# order.order_date = params[:order_date]
		order.order_line_items.build
		order
	end

end
