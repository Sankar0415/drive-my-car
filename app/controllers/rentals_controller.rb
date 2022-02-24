class RentalsController < ApplicationController
  def create
    @rental = Rental.new(strong_params)
    @rental.car = Car.all.sample
    @rental.user = User.all.sample
    if @rental.save
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:rental).permit(:rental_begin, :rental_end)
  end
end
