class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @weather_prevision_d1 = weather_prevision_d1
    @weather_prevision_d2 = weather_prevision_d2
    @weather_prevision_d3 = weather_prevision_d3
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to city_path(@city)
    else
      redirect_to cities_path
    end
  end

  private

  def city_params
    params.permit(:name, :longitude, :latitude, :country, :region, :department)
  end

  def weather_prevision_d1
    if WeatherPrevision.exists?(city: @city, date: Date.today + 1)
      WeatherPrevision.find_by(city: @city, date: Date.today + 1)
    else
      random_weather_prevision(Date.today + 1)
    end
  end

  def weather_prevision_d2
    if WeatherPrevision.exists?(city: @city, date: Date.today + 2)
      WeatherPrevision.find_by(city: @city, date: Date.today + 2)
    else
      random_weather_prevision(Date.today + 2)
    end
  end

  def weather_prevision_d3
    if WeatherPrevision.exists?(city: @city, date: Date.today + 3)
      WeatherPrevision.find_by(city: @city, date: Date.today + 3)
    else
      random_weather_prevision(Date.today + 3)
    end
  end

  def random_weather_prevision(day)
    city = City.find(params[:id])
    weathers_array = []
    WeatherType.all.each { |weather| weather.weight.times { weathers_array << weather } }
    weather_type = weathers_array.sample
    # weather_type = WeatherType.order('RANDOM()').first
    wind_direction = WindDirection.order('RANDOM()').first
    # raise
    temperature = if WeatherPrevision.exists?(city_id: city.id)
                    WeatherPrevision.find_by(city: city, date: day - 1).temperature
                  else
                    (12..25).to_a.sample
                  end
    temperature += weather_type.temp
    # temperature_feels_like = (10..25).to_a.sample
    # wind_speed = (0..60).to_a.sample

    WeatherPrevision.create!(date: day, city: city, weather_type: weather_type, temperature: temperature, wind_direction: wind_direction)
  end
end
