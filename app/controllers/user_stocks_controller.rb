class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by(ticker: params[:stock_ticker])
    stock = Stock.new_from_lookup(params[:stock_ticker]) unless stock
    stock.save
    
    @user_stock = UserStock.new(user: current_user, stock: stock)
    if @user_stock.save
      flash[:success] = "Stock #{stock.name} was successfully added to your portfolio"
    else
      flash[:danger] = @user_stock.errors.full_messages
    end
    redirect_to my_portfolio_path
  end

  def destroy
    current_user.user_stocks.find_by(stock_id: params[:id]).destroy
    flash[:notice] = "Stock was successfully removed from your portfolio."
    redirect_to my_portfolio_path
  end

end
