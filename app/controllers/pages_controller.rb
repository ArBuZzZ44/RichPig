class PagesController < ApplicationController
  def index
    @capitals = Capital.where(status: 'done').order(created_at: :desc)
    @capitals = @capitals.decorate
  end
end