class ActivityDetail < ApplicationRecord
	belongs_to :work_detail, dependent: :destroy
	# belongs_to :employee, optional: true
	has_many :employee_activitys, dependent: :destroy
	accepts_nested_attributes_for :employee_activitys
	ACTIVITY_STATUS = {started: 0, completed: 1}

def self.new_activity
	 @activity_detail = ActivityDetail.new
     @activity_detail.employee_activitys.build
	  @activity_detail
end
	def status_val
		# p ACTIVITY_STATUS[status]
    ACTIVITY_STATUS[status]
  end
 

end
