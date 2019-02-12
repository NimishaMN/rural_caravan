class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|

      t.timestamps
    end
  end
end
