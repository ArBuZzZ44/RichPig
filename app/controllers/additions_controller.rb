class AdditionsController < ApplicationController
  def create 
    @capital = Capital.find params[:capital_id]
    @addition = @capital.additions.build addition_params
    @balance = @capital.additions.sum(:balance)

    if @addition.save
      flash[:success] = "You have replenished the piggy bank"
      redirect_to capital_path(@capital)
    else
      @additions = @capital.additions.order created_at: :desc
      @additions = @additions.decorate
      @capital = @capital.decorate
      render "capitals/show"
    end

    def index 
    end

  end

  private 

  def addition_params
    params.require(:addition).permit(:balance)
  end
end