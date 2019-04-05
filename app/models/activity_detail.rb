class ActivityDetail < ApplicationRecord
	belongs_to :work_detail
	serialize :employes
	ACTIVITY_STATUS = {started: 0, completed: 1}

def self.new_activity
	 @activity_detail = ActivityDetail.new
	 @activity_detail
end
	def status_val
		# p ACTIVITY_STATUS[status]
    ACTIVITY_STATUS[status]
  end
 

end
