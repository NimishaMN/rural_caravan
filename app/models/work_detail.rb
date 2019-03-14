class WorkDetail < ApplicationRecord
	belongs_to :business
	belongs_to :product
	has_many :activity_details
end
