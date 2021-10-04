class WeatherPrevisionsController < ApplicationController
  def new
    @city = City.find(params[:city_id])
    @weather_prevision = WeatherPrevision.new(date: params[:date])
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
      notice = case @weather_prevision.errors.attribute_names
               when [:weather_type]
                 'selectionnez un weather type'
               when [:date]
                 'une prevision existe déjà ce jour là'
               when [:temperature]
                 'selectionnez une temperature'
               else
                 'un problème est survenu'
               end
      redirect_to new_city_weather_prevision_path(@city, params: { date: @weather_prevision[:date] }), notice: notice
    end
  end

  private

  def weather_prevision_params
    params.require(:weather_prevision).permit(:date, :temperature)
  end
end
