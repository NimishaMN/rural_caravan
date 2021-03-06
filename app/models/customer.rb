class Customer < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many :incomes
	validates :name, :presence => true, :uniqueness => {:scope => :user_id}

	def full_address
		address1 = "#{address} #{city} #{state} #{country}"
		address1
	end
end
