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
    @capital = Capital.find params[:id]
    @capital = @capital.decorate 

    @addition = @capital.additions.build
    @additions = @capital.additions.order created_at: :desc
    @additions = @additions.decorate

    @balance = @capital.additions.sum(:balance)
  end

  def edit
    @capital = Capital.find params[:id]
  end

  def update
    @capital = Capital.find params[:id]

    if @capital.update capital_params
      flash[:success] = 'Goal updated'
      redirect_to capitals_path
    else
      render :edit 
    end
  end

  def destroy
    @capital = Capital.find params[:id]

    @capital.destroy
    flash[:success] = 'The goal has been deleted'
    redirect_to capitals_path
  end

  private

  def capital_params
    params.require(:capital).permit(:goal, :amount, :period, :status)
  end
end