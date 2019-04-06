class Vendor < ApplicationRecord
	has_many :expenses
	validates :name, :presence => true, :uniqueness => {:scope => :user_id}

	def full_address
		address1 = "#{address} #{city} #{state}, #{country}"
		address1
	end
end
