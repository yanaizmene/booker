class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session], :remember_me => true)
    if @user_session.save
      flash[:notice]      = "Login successful!"
      session[:wallet_id] = current_user.wallets.first
      
      redirect_to new_transaction_url
    else
      render :action => :new
    end
  end
  
  def destroy
    unless current_user.nil?
      current_user_session.destroy
    end
  end
end