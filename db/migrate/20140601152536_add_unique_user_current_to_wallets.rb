class AddUniqueUserCurrentToWallets < ActiveRecord::Migration
  def change
  	add_index :wallets, [:user_id, :current], :unique => true
  end
end
