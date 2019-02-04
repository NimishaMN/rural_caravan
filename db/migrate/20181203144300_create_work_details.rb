class CreateWorkDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :work_details do |t|
    	t.string :name, :null =>false
    	t.string :unit_of_measure
    	t.integer :business_id
      t.timestamps
    end
  end
end
