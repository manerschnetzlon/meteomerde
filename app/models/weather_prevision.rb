class WeatherPrevision < ApplicationRecord
  belongs_to :city
  belongs_to :weather_type
end
