class EmployeeActivity < ApplicationRecord
	belongs_to :employee, optional: true
	#belongs_to :activity_detail, foreign_key: :activity_detail_id, optional: true
end
