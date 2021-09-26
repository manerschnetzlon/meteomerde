class WeatherPrevisionsController < ApplicationController
  def new
    @city = City.find(params[:city_id])
    @weather_prevision = WeatherPrevision.new
    @weather_types = WeatherType.all
  end

  def create
    @weather_prevision = WeatherPrevision.new(weather_prevision_params)
    @city = City.find(params[:city_id])
    @weather_prevision.city = @city
    unless params[:weather_prevision][:weather_type].blank?
      @weather_prevision.weather_type = WeatherType.find(params[:weather_prevision][:weather_type])
    end
    if @weather_prevision.save
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  private

  def weather_prevision_params
    params.require(:weather_prevision).permit(:date, :temperature)
  end
end
