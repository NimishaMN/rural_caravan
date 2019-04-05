class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
    	t.string :name, :null => false
    	t.string :gender
    	t.decimal :salary
    	t.string :address
    	t.string :city
    	t.string :state, default: 'Maharashtra'
    	t.string :country, default: 'India'

      t.timestamps
    end
  end
end
