class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
    	t.string :name, :null => false
	    t.string :phone_number
	    t.string :email
      t.timestamps
    end
  end
end
