class SubscriptionsController < ApplicationController
  def index; end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:notice] = "You are no longer following #{User.find(@subscription.followee_id).full_name}."
    redirect_to subscriptions_path
  end

end