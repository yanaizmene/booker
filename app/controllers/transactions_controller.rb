class TransactionsController < ApplicationController
  before_action :require_login

  def index
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
      params.require(:transaction).permit(:amount, :income, :description)
    end

    def require_login
      if current_user.nil?
        redirect_to login_url
      end
    end
end
