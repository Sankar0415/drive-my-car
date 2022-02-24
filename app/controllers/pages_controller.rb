class PagesController < ApplicationController
  def home
  end

  def dashboard
    @mycars = Car.all.filter { |car| car.user == current_user }
    @myrentals = Rental.all.filter { |rental| rental.user == current_user }
    @rentalsofmycar = Rental.all.filter { |rental| current_user.cars.include? rental.car }
  end
end
