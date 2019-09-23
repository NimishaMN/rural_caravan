class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.string  :order_number
	    t.date  :record_date
	    t.date :order_date
	    t.integer :status, default: 0
	    t.references :customer

      t.timestamps
    end
  end
end
