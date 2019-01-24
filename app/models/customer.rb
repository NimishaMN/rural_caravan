class Customer < ApplicationRecord
	has_many :orders, -> {where(deleted: false)}, dependent: :destroy
end
