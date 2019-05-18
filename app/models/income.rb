class Income < ApplicationRecord
	enum income_status: { Paid: 1, Unpaid: 0 }
	belongs_to :user
	belongs_to :customer, foreign_key: :customer_id, optional: true

end
