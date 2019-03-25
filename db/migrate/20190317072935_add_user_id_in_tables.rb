class AddUserIdInTables < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :user_id, :integer, null: false
  	add_column :activity_details, :user_id, :integer, null: false
  	add_column :work_details, :user_id, :integer, null: false
  	add_column :activity_details_employees, :user_id, :integer, null: false
  	add_column :billings, :user_id, :integer, null: false
  	add_column :businesses, :user_id, :integer, null: false
  	add_column :customers, :user_id, :integer, null: false
  	add_column :orders, :user_id, :integer, null: false
  	add_column :products, :user_id, :integer, null: false

  end
end
