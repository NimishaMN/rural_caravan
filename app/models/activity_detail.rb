class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, optional: true
	# belongs_to :employee, optional: true
	serialize :employees, Array
	has_many :employee_activity
	enum status: {Completed: 1 , Inprogress: 0}

def self.new_activity
	 @activity_detail = ActivityDetail.new
	 @activity_detail
end
	def status_val
		# p ACTIVITY_STATUS[status]
    ACTIVITY_STATUS[status]
  end
 

end
