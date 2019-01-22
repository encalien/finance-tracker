class SubscriptionsController < ApplicationController
  def index; end

  def create
    followee = User.find(params[:followee])
    @subscription = Subscription.new(user: current_user, followee: followee)
    if @subscription.save
      flash[:success] = "Congratulations! You are now following user #{followee.full_name}."
    else
      flash[:danger] = @subscription.errors.full_messages
    end
    redirect_to subscriptions_path
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:notice] = "You are no longer following #{User.find(@subscription.followee_id).full_name}."
    redirect_to subscriptions_path
  end

end