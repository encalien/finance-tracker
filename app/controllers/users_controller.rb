class UsersController < ApplicationController
  def my_portfolio
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    if params[:search_param].blank? 
      flash.now[:danger] = "You have entered an empty search string."
    else
      @users = User.search(params[:search_param], current_user)
      flash.now[:warning] = "No users match your search criteria." if @users.empty?
    end
    respond_to do |format|
      format.js { render partial: "users/result" }
    end
  end
end