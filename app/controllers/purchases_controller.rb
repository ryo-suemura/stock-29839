class PurchasesController < ApplicationController
  before_action :setting, only: [:new, :create]
 
  def new
    @purchase = Purchase.new
  end
 
  def create
    @purchase = Purchase.create(purchase_params)
    if @purchase.save && @stock.stock > 0
      @stock.decrement!(:stock, @purchase.quantity)
      redirect_to root_path
    elsif @purchase.quantity == 0
      render :new
    else
      render :new
    end
  end

  private

  def setting
    @stock = Stock.find(params[:stock_id])
  end

  def purchase_params
    params.permit(:quantity).merge(stock_id: params[:stock_id], user_id: current_user.id)
  end
end