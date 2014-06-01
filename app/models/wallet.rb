class Wallet < ActiveRecord::Base
  belongs_to	:user
  has_many 		:transactions
  belongs_to	:currency

  validates :name, presence: true
  validates :currency_id, presence: true

  before_create :set_id

  private
    def set_id
      self.wallet_id = Wallet.maximum('wallet_id').to_i + 1
    end
end
