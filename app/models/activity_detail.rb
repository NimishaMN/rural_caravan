class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, optional: true
	# belongs_to :employee, optional: true
	has_many :employee_activity
	enum status: {Completed: 1 , Inprogress: 0}

	

end
