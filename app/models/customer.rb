class Customer < ApplicationRecord
	has_many :orders, -> {where(deleted: false)}, dependent: :destroy
	has_many :expenses
	validates :name, :presence => true, :uniqueness => {:scope => :user_id}
end
