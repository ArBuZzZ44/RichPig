class OperationsController < ApplicationController
	def create
		@wallet = Wallet.find params[:wallet_id]
    @operation = @wallet.operations.build operation_params

		if @operation.save
			if @operation[:operation_type] == "Profit"
				flash[:success] = "Your profit is recorded in the transaction summary"
			else
				flash[:success] = "Your expense is recorded in the transaction summary"
			end
			redirect_to wallet_path(@wallet)
		else
			@operations = @wallet.operations.order created_at: :desc
			@operations = @operations.decorate
			render "wallets/show"
		end
	end

	private 

	def operation_params
		params.require(:operation).permit(:operation_amount, :operation_date, :operation_type)
	end
end