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
    @city.save
    redirect_to city_path(@city)
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
    weather_type = WeatherType.order('RANDOM()').first
    wind_direction = WindDirection.order('RANDOM()').first
    temperature = (-15..45).to_a.sample
    temperature_feels_like = (-15..45).to_a.sample
    wind_speed = (0..120).to_a.sample

    WeatherPrevision.create(date: day, city: city, weather_type: weather_type, temperature: temperature, temperature_feels_like: temperature_feels_like, wind_direction: wind_direction, wind_speed: wind_speed)
  end
end
