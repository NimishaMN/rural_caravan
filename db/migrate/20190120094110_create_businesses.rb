class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
    	t.string :name, :null => false
    	t.string :product_name
    	t.string :unit_of_measure
      t.timestamps
    end
  end
end
