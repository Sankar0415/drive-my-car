class CarsController < ApplicationController
  def index
    if user_signed_in?
      @cars = Car.all.reject { |car| car.user == current_user }
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
    @rental = Rental.new
    # raise
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

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
  end

  private

  def strong_params
    params.require(:car).permit(:model, :brand, :price, :photo)
  end
end
