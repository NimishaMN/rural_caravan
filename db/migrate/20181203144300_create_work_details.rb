class CreateWorkDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :work_details do |t|
    	t.string :name, :null =>false
    	t.string :unit_of_measure
    	t.references :business
    	t.references :product
    	t.integer :sequence
      t.timestamps
    end
  end
end
