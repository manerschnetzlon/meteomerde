class CitiesController < ApplicationController
  def index
    # @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    weather_prevision(Date.today + 1)
    weather_prevision(Date.today + 2)
    weather_prevision(Date.today + 3)
    # @previsions = WeatherPrevision.where(city: @city).where('date > ?', Date.today).order(date: :asc)
    @previsions = WeatherPrevision.where(city: @city).where('date > ?', Date.today).select('DISTINCT ON ("date") *').order(:date, created_at: :desc)
    # @today_real_weather = today_real_weather(@city)
  end

  def create
    city_attributes = city_attributes(city_params)

    if city_attributes[:department].nil?
      redirect_to cities_path, notice: "Désolé, impossible d'afficher les prévisions météo pour #{city_attributes[:name]}, meteomerde ne couvre actuellement que la France métropolitaine :'("
    elsif City.exists?(city_attributes)
      redirect_to city_path(City.find_by(city_attributes))
    else
      @city = City.new(city_attributes)
      redirect_to @city.save ? city_path(@city) : cities_path
    end
  end

  private

  def city_params
    params.permit(:name, :longitude, :latitude, :country, :region, :department)
  end

  def city_attributes(city_params)
    { name: city_params[:name],
      longitude: city_params[:longitude],
      latitude: city_params[:latitude],
      country: city_params[:country],
      region: city_params[:region],
      department: find_department(city_params[:department]) }
  end

  def find_department(params_department)
    if %w[2A 2B].include?(params_department)
      Department.find_by(number: 20)
    else
      Department.find_by(number: params_department.to_i)
    end
  end

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
  end

  def today_real_weather(city)
    api_key = ENV['OPEN_WEATHER_MAP_API_KEY']
    request_api(
      "http://api.openweathermap.org/data/2.5/weather?lat=#{city.latitude}&lon=#{city.longitude}&units=metric&appid=#{api_key}"
    )
  end

  def weather_prevision(date)
    if WeatherPrevision.exists?(city: @city, date: date)
      WeatherPrevision.find_by(city: @city, date: date)
    else
      random_weather_prevision(date)
    end
  end

  def random_weather_prevision(day)
    city = City.find(params[:id])
    record = TemperatureRecord.find_by(department: city.department, month: Date.today.month)
    temperature = if WeatherPrevision.exists?(city_id: city.id, date: day - 1)
                    last_temp = WeatherPrevision.find_by(city: city, date: day - 1).temperature
                    last_temp += (last_temp - record.temp_min) if last_temp - 2 <= record.temp_min
                    last_temp -= (record.temp_max - last_temp) if last_temp + 2 >= record.temp_max
                    temp = ((last_temp - 3)..(last_temp + 3)).to_a.sample
                    temp = record.temp_min if temp < record.temp_min
                    temp = record.temp_max if temp > record.temp_max
                    temp
                  else
                    ((record.temp_min)..(record.temp_max)).to_a.sample
                  end

    weathers_min = WeatherType.where('temperature_min <= ?', temperature).or(WeatherType.where(temperature_min: nil))
    weathers_max = WeatherType.where('temperature_max >= ?', temperature).or(WeatherType.where(temperature_max: nil))
    possible_weathers = weathers_min & weathers_max
    weathers_array = []
    possible_weathers.each { |weather| weather.weight.times { weathers_array << weather.id } }
    weather_type = WeatherType.find(weathers_array.sample)

    WeatherPrevision.create!(date: day, city: city, weather_type: weather_type, temperature: temperature)
  end
end
