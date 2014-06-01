class AddWalletIdToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :wallet_id, :integer
  end
end
