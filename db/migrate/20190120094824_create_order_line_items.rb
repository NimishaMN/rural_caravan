class CreateOrderLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_line_items do |t|
    	t.integer  :order_id
    	t.integer :product_id
	    t.decimal :quantity, :precision => 10, :scale => 2
		t.decimal :unit_rate, :precision => 18, :scale => 2
		t.decimal :tax
		t.decimal :amount, :precision => 18, :scale => 2
		t.text :description
      t.timestamps
    end
  end
end
