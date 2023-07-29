class OperationsController < ApplicationController
	def create
		@wallet = Wallet.find params[:wallet_id]
    @operation = @wallet.operations.build operation_params

		if @operation.save
			flash[:success] = "The operation was successful"
			redirect_to wallet_path(@wallet)
		else
			@operations = @wallet.operations.order created_at: :desc
			render "wallets/show"
		end
	end

	private 

	def operation_params
		params.require(:operation).permit(:operation_amount, :operation_date, :operation_type)
	end
end