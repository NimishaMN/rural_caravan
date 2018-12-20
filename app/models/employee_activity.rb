class EmployeeActivity < ApplicationRecord
	belongs_to :employee, optional: true
	belongs_to :activity_details, optional: true
end
