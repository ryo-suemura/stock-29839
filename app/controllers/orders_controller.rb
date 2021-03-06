class OrdersController < ApplicationController
  before_action :setting, only: [:new, :create, :destroy]

  def index
    @orders = Order.order('created_at DESC')
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      @stock.increment!(:stock, @order.quantity)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    binding.pry
    order = Order.find(params[:id])
    if order.destroy
      @stock.decrement!(:stock, order.quantity)
      redirect_to orders_path
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
