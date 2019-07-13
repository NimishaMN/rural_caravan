class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
	    t.string  :name, :null => false, :size => 100
	    t.string  :unit_of_measure, :size => 100
	    t.string :description
	    t.references :business
	    t.decimal :unit_cost, :precision => 18, :scale => 2
	    t.decimal :unit_price, :precision => 18, :scale => 2
      t.timestamps
    end
  end
end
