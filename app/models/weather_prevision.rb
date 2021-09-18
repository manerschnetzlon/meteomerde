class WeatherPrevision < ApplicationRecord
  belongs_to :city
  belongs_to :weather_type
  belongs_to :wind_direction
end
