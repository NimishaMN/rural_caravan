class EmployeeActivity < ActiveRecord::Migration[5.2]
  def change
  	create_table :employee_activity do |t|
    	t.integer :employee_id, :null => false
    	t.integer :activity_detail_id, :null => false
    	t.timestamps
    end
  end
end
