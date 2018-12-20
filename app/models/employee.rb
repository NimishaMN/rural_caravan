class Employee < ApplicationRecord
	validates :name, :presence => true
	# has_many :activity_details
	has_many :employee_activity
end
