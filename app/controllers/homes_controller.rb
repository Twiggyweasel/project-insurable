class HomesController < ApplicationController

  def new
    @home = Home.new
  end

  def create
  @home = Home.new(home_params)
  if @home.save
    flash[:success] = "New Property Created"
    redirect_to root_path
  else
    render :new
  end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])

    if @home.update(home_params)
      flash[:success] = "Property Updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    if @home.destroy
      flash[:success] = "Property was deleted"
    else
      flash[:error] = "Property couldn't be deleted"
    end
    redirect_to root_path
  end
  private
    def home_params
      params.require(:home).permit(:name, :purchase_date, :value)
    end
end
