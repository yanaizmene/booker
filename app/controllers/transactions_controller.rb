class TransactionsController < ApplicationController
  before_action :require_login

  def index
    # for i in 0..500
    #   current_wallet.transactions.create({
    #     amount: [*10..500].sample,
    #     wallet_id: 1,
    #     category_id: [*1..8].sample
    #   })
    # end

    # raise 1.inspect
    #raise current_wallet.inspect
    #set_current_wallet(7);

  	@per_page		    = 10
  	@offset 		    = params[:offset] ? (params[:offset].to_i - 1) * @per_page : 0

  	@total			    = current_wallet.transactions.count
  	@transactions 	= current_wallet.transactions.order(created_at: :desc).limit(@per_page).offset(@offset).all()

    respond_to do |format|
      format.html
	    format.js { render partial: 'list', :layout => false }
	  end
  end

  def new
    #current_wallet
  	@transaction = current_user.transactions.new
  end
  
  def create
    @transaction = current_wallet.transactions.create(transaction_params)
    if @transaction.save
      redirect_to :transactions
    else
      render 'new'
    end
  end

  private
    def transaction_params
      params.require(:transaction).permit(:amount, :income, :description, :category_id)
    end

    def require_login
      if current_user.nil?
        redirect_to login_url
      end
    end
end
