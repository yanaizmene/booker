class WalletsController < ApplicationController
  def index
  	current_user
  end

  def new
  	@wallet = current_user.wallets.new
  end

  def create
    @wallet = current_user.wallets.create(wallet_params)
    if @wallet.save
      redirect_to :wallets
    else
      render 'new'
    end
  end

  def set_wallet
  	@wallet = current_user.wallets.find_by(wallet_id: params[:id])

  	unless @wallet.nil?
  	  current_user.wallets.update_all(:current => nil)
  	  @wallet.update(:current => true)
  	end	

  	redirect_to(:back)  	
  end

  private
    def wallet_params
      params.require(:wallet).permit(:name, :amount, :currency_id)
    end
end