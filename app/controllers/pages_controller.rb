class PagesController < ApplicationController
  def home
  end

  def dashboard
    @cars = Car.all
  end
end
