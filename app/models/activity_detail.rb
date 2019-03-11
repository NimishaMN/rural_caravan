class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, optional: true
	# belongs_to :employee, optional: true
	has_many :employee_activity
	ACTIVITY_STATUS = {started: 0, completed: 1}

	def status_val
		p ACTIVITY_STATUS[status]
    ACTIVITY_STATUS[status]
  end

end
