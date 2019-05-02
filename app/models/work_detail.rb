class WorkDetail < ApplicationRecord
	belongs_to :business
	belongs_to :product
	has_many :activity_details
	validates_uniqueness_of :sequence, :presence => true, :scope => :product_id, :message => " already taken"
end
