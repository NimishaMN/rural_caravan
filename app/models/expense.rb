class Expense < ApplicationRecord
	enum status: { Receivable: 0, Payable: 1 }
	belongs_to :user
	belongs_to :customer, foreign_key: :customer_id, optional: true


	
end
