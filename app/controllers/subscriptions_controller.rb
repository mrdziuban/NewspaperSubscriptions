class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(params[:subscription])
    @subscription.user_id = @current_user.id
    if @subscription.save
      redirect_to :back
    else
      flash[:notices] = "Could not subscribe"
      redirect_to :back
    end
  end

  def destroy
    subscription = Subscription.find_by_subscription_plan_id(params[:id])
    subscription.destroy
    redirect_to :back
  end
end