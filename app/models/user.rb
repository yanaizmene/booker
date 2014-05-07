class User < ActiveRecord::Base
   acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  	
  has_many :wallets
  has_many :transactions, through: :wallets


  after_create :create_wallet

  protected
    def create_wallet
      @wallet = Wallet.new
    
      @wallet.name	= I18n.t(:wallet)
      @wallet.user_id = id
      @wallet.amount  = 0
      
      @wallet.save
    end
end
