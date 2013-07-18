class NewspapersController < ApplicationController
  def index
    @newspapers = Newspaper.all
  end

  def new
    @newspaper = Newspaper.new
  end

  def create
    @newspaper = Newspaper.new(params[:newspaper])
    @newspaper.subscription_plans.each do |sp|
      sp.newspaper_id = @newspaper.id
    end
    if @newspaper.save
      redirect_to newspaper_url(@newspaper)
    else
      p @newspaper.errors.full_messages
      flash[:notices] = "Could not create newspaper"
      render :new
    end
  end

  def show
    @newspaper = Newspaper.find(params[:id])
  end

  def edit
    @newspaper = Newspaper.find(params[:id])
    if @newspaper.user != @current_user
      redirect_to newspaper_url(@newspaper)
    end
  end

  def update
    @newspaper = Newspaper.find(params[:id])
    if @newspaper.update_attributes(params[:newspaper])
      redirect_to newspaper_url(@newspaper)
    else
      flash[:notices] = "Could not update newspaper"
      render :edit
    end
  end

  def destroy
    @newspaper = Newspaper.find(params[:id])
    @newspaper.destroy
    redirect_to newspapers_url
  end
end