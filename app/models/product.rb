class Product < ApplicationRecord
	has_many :work_details
	has_many :orders
end
