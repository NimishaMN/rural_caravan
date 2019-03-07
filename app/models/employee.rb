class Employee < ApplicationRecord
	validates :name, :presence => true
	# has_many :activity_details
	has_and_belongs_to_many :activity_details
end
