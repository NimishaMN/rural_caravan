class WorkDetail < ApplicationRecord
	belongs_to :business
	has_many :activity_details
end
