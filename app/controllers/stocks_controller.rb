class StocksController < ApplicationController

  def search
    if params[:search_param].blank? 
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:search_param])
      flash.now[:danger] = "You have entered an invalid symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: "stocks/result" }
    end
  end

end