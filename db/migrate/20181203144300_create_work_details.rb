class CreateWorkDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :work_details do |t|
    	t.string :name, :null =>false
    	t.string :unit_of_measure
    	t.references :business_id
    	t.references :product_id
    	t.integer :sequence
      t.timestamps
    end
  end
end
