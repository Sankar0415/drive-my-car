class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(strong_params)
    # @car.user = User.all.sample
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:car).permit(:model, :brand, :price, :photo)
  end
end
