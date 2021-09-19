class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def create
    @city = City.new(name: params["name"])
    @city.save
  end

  private

  def city_params
    params.require(:city).permit(:name, :longitude, :latitude, :country, :region, :department)
  end
end
