class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def new 
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def stock_params
    params.require(:stock).permit(:number, :name, :author, :stock, :genre_id, :code_id, :publisher_id).merge(user_id: current_user.id)
  end
end
