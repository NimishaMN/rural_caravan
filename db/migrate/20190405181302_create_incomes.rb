class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
    	t.references :user
    	t.date :income_date
    	t.references :customer
    	t.decimal :amount, :precision => 18, :scale => 2, :default => 0
    	t.string :description
    	t.integer :income_status, default: 1
      t.timestamps
      t.timestamps
    end
  end
end
