class Business < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :work_details, dependent: :destroy
end
