class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
    	t.string :name, :null => false
	    t.string :phone_number
	    t.string :email
	    t.string :address
	    t.string :city
	    t.string :state
	    t.string :country, default: 'India'
      t.timestamps
    end
  end
end
