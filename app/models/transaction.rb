class Transaction < ActiveRecord::Base
  belongs_to :wallet
  belongs_to :location
  belongs_to :category

  after_create :update_wallet_amount
  before_create :set_transaction_id

  private
    def update_wallet_amount
      wallet.amount = income? ? wallet.amount + amount : wallet.amount - amount
      wallet.save
    end

    def set_transaction_id
      self.transaction_id = wallet.transactions.maximum('transaction_id').to_i + 1
    end
end