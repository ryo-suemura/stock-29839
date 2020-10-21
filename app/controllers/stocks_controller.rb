class StocksController < ApplicationController
  def index
    @q = Stock.ransack(params[:q])
    @stocks = @q.result(distinct: true)
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

  def search
    @stocks = Stock.search(params[:keyword])
  end

  private
  def stock_params
    params.require(:stock).permit(:number, :name, :author, :stock, :genre_id, :code_id, :publisher_id).merge(user_id: current_user.id)
  end
end
