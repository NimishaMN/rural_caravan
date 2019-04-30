class Employee < ApplicationRecord
	validates :name, :presence => true
	# has_many :activity_details
	has_and_belongs_to_many :activity_details

	def full_address
		address1 = "#{address} #{city} #{state} #{country}"
		address1
	end
end
