class Income < ApplicationRecord
	enum status: { Paid: 0, Unpaid: 1 }
	belongs_to :user
	belongs_to :customer, foreign_key: :customer_id, optional: true

end