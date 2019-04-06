class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
    	t.references :user
    	t.date :expense_date
    	t.references :vendor
    	t.decimal :amount, :precision => 18, :scale => 2, :default => 0
    	t.string :description
    	t.integer :expense_status
      t.timestamps
    end
  end
end
