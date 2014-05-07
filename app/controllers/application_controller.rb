class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user, :current_wallet

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def current_wallet
      return @current_wallet if defined?(@current_wallet)
      @current_wallet = current_user.wallets.first
    end

    # def set_current_wallet
    #   @current_wallet = Wallet.find(4)
    # end
end
