class CapitalsController < ApplicationController

  def new
    @capital = Capital.new 
  end

  def create
    @capital = Capital.new capital_params

    if @capital.save
      flash[:success] = 'You started saving money'
      redirect_to capitals_path
    else
      render :new
    end
  end

  def index
    @capitals = Capital.all.order(created_at: :desc)
    @capitals = @capitals.decorate
  end

  def show 
  end

  def destroy
    @capital = Capital.find params[:id]

    @capital.destroy
    flash[:success] = 'The goal has been deleted'
    redirect_to capitals_path
  end

  private

  def capital_params
    params.require(:capital).permit(:goal, :amount, :period)
  end
end