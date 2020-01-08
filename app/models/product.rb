class Product < ApplicationRecord
	belongs_to :business
	has_many :work_details
	has_many :orders
end
