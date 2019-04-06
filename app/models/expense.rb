class Expense < ApplicationRecord
	enum status: { Paid: 0, Unpaid: 1 }
	belongs_to :user
	belongs_to :vendor, foreign_key: :vendor_id, optional: true


	
end
