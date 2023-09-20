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
		@pagy, @operations = pagy @wallet.operations.filter_operations(params[:filter]).order created_at: :desc

		@operations = @operations.decorate
		
		@sum_of_expenses = @wallet.operations.where(operation_type: 'Expense').sum(:operation_amount)
		@balance_of_budget = @wallet[:budget] - @sum_of_expenses

		@diff = (@wallet.end_date.to_date - Time.now.to_date).to_i
		
	end

  def index
		@pagy, @wallets = pagy Wallet.order(created_at: :desc)
  end

	def destroy
	end

  private

  def wallet_params
    params.require(:wallet).permit(:budget, :start_date, :end_date)
  end
end