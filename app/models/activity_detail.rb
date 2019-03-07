class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, optional: true
	# belongs_to :employee, optional: true
	has_and_belongs_to_many :employees
end
