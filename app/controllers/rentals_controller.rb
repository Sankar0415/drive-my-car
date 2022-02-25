class RentalsController < ApplicationController
  def create
    @rental = Rental.new(strong_params)
    @rental.car = Car.find(params[:car_id])
    @rental.user = current_user
    if @rental.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:rental).permit(:rental_begin, :rental_end)
  end
end
