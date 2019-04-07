class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, optional: true
	# belongs_to :employee, optional: true
	has_many :employee_activity
	ACTIVITY_STATUS = {'0' => "started", '1' => "completed"}

	def get_status
		# p ACTIVITY_STATUS[status]
    ACTIVITY_STATUS[status.to_s]
  end

end
