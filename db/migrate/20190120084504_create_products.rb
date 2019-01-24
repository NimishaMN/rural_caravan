class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
	    t.string  :name, :null => false, :size => 100
	    t.string  :unit_of_measure, :size => 100
	    t.integer :business_id
      t.timestamps
    end
  end
end
