class StocksController < ApplicationController
  
  def index
    @stocks = Stock.all
  end

  def new 
    @stock = Stock.new
  end

  def create
    Stock.create(stock_params)
  end

  private
  def stock_name
    params.require(:stock).permit(:number, :name, :author, :stock, :genre_id, :code_id, :publisher_id).merge(user_id: current_user.id)
  end
end
