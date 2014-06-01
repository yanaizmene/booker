class Currency < ActiveRecord::Base
  has_many :wallets
end
