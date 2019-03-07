class EmployeeActivities < ActiveRecord::Migration[5.2]
  def change
  	create_table :activity_details_employees do |t|
    	t.belongs_to :employee, index: true
    	t.belongs_to :activity_detail, index: true
    	t.timestamps
    end
  end
end
