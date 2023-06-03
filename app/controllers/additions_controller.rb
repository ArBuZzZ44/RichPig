class AdditionsController < ApplicationController
  def create 
    @capital = Capital.find params[:capital_id]
    @addition = @capital.additons.build addition_params

    if @addition.save 
      flash[:success] = "You have replenished the piggy bank"
      redirect_to capital_path(@capital)
    else
      @additions = Addition.order created_at: :desc
      render "capitals/show"
    end
  end

  private 

  def addition_params
    params.require(:addition).permit(:balance)
  end
end