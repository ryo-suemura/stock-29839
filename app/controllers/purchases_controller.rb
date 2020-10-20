class PurchasesController < ApplicationController
  before_action :setting, only: [:new, :create]
 
  def new
    @purchase = Purchase.new
  end
 
  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      @stock.decrement!(:stock, @purchase.quantity)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def setting
    #@stock = Stock.find(params[:stock_id])
  end

  def purchase_params
    params.require(:purchase).permit(:quantity).merge(user_id: current_user.id, stock_id: @purchase.stock)
  end
end
