class OrdersController < ApplicationController
  before_action :setting, only: [:new, :create]
 
  def new
    @purchase = Purchase.new
  end
 
  def create
    @purchase = Purchase.create(order_params)
    if @purchase.save
      @stock.increment!(:stock, @purchase.quantity)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def setting
    @stock = Stock.find(params[:stock_id])
  end

  def order_params
    params.permit(:quantity).merge(stock_id: params[:stock_id], user_id: current_user.id)
  end
end
