class WalletsController < ApplicationController
  def new
    @wallet = Wallet.new
  end

  def create
    @wallet = Wallet.new wallet_params

    if @wallet.save
      flash[:success] = "A new budget has been successfully created"
      redirect_to wallets_path
    else
      render :new
    end
  end

	def show
		@wallet = Wallet.find params[:id]

		@operation = @wallet.operations.build
		@operations = @wallet.operations.order created_at: :desc

		@operations = @operations.decorate
	end

  def index
		@wallets = Wallet.order(created_at: :desc)
  end

  private

  def wallet_params
    params.require(:wallet).permit(:budget, :start_date, :end_date)
  end
end