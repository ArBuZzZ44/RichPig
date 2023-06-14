class AdditionsController < ApplicationController

  def create 
    @capital = Capital.find params[:capital_id]
    @addition = @capital.additions.build addition_params

    if @addition.save
      flash[:success] = "You have replenished the piggy bank"
      redirect_to capital_path(@capital)
    else
      @additions = @capital.additions.order created_at: :desc
      @additions = @additions.decorate
      @capital = @capital.decorate
      render "capitals/show"
    end

    @balance = @capital.additions.sum(:balance)

    if @balance >= @capital[:amount]
      @capital[:status] = "done"
      flash[:success] = "You have reached the goal!"
      @capital.save
    end
  end


  private 

  def addition_params
    params.require(:addition).permit(:balance)
  end
end