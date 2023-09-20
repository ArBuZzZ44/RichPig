class CapitalsController < ApplicationController
	before_action :set_capital!, only: %i[show update edit destoy]

  def new
    @capital = Capital.new 
  end

  def create
    @capital = Capital.new capital_params

    if @capital.save
      flash[:success] = 'You started saving money'
      redirect_to capitals_path(anchor: "capital-#{@capital.id}")
    else
      render :new
    end
  end

  def index
    capitals_status('not completed')
    @capitals = @capitals.decorate
  end

  def show
    @capital = @capital.decorate 

    @addition = @capital.additions.build
    @additions = @capital.additions.order created_at: :desc
    @additions = @additions.decorate

    @balance = @capital.additions.sum(:balance)
  end

  def edit
  end

  def update
    if @capital.update capital_params
      flash[:success] = 'Goal updated'
      redirect_to capitals_path
    else
      render :edit 
    end
  end

  def destroy
    @capital.destroy
    flash[:success] = 'The goal has been deleted'
    redirect_to capitals_path
  end

  def completed 
    capitals_status('done')
    @capitals = @capitals.decorate
  end

  private

  def capital_params
    params.require(:capital).permit(:goal, :amount, :period, :status)
  end

	def set_capital!
		@capital = Capital.find params[:id]
	end

	def capitals_status(status)
		@capitals = Capital.where(status: status).order(created_at: :desc)
	end
end