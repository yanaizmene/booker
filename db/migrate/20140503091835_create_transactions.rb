class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :type
      t.float :amount

      t.timestamps
    end
  end
end
