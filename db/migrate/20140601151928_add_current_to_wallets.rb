class AddCurrentToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :current, :boolean, :default => true
  end
end
