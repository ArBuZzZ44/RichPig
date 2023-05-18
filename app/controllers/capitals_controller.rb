class CapitalsController < ApplicationController

  def new
    @capital = Capital.new 
  end

  def create
    @capital = Capital.new capital_params

    if @capital.save
      flash[:success] = 'You started saving money'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def capital_params
    params.require(:capital).permit(:goal, :amount, :period)
  end
end