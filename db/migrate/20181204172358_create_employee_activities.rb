class CreateEmployeeActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_activities do |t|

      t.timestamps
    end
  end
end
