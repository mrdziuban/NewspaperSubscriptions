class SubscriptionPlansController < ApplicationController
  def new
    @subscription_plan = SubscriptionPlan.new
  end

  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])
    @subscription_plan.newspaper_id = params[:newspaper_id]
    if @subscription_plan.save
      redirect_to newspaper_url(@subscription_plan.newspaper)
    else
      flash[:notices] = "Could not create subscription plan"
      render :new
    end
  end

  def edit
    @subscription_plan = SubscriptionPlan.find(params[:id])
    @np = @subscription_plan.newspaper
  end

  def update
    @subscription_plan = SubscriptionPlan.find(params[:id])
    if @subscription_plan.update_attributes(params[:subscription_plan])
      redirect_to newspaper_url(@subscription_plan.newspaper)
    else
      flash[:notices] = "Could not update subscription plan"
      render :edit
    end
  end

  def destroy
    @subscription_plan = SubscriptionPlan.find(params[:id])
    @subscription_plan.destroy
    redirect_to :back
  end
end