class WeatherType < ApplicationRecord
  has_many :weather_previsions
  validates :name, presence: true
end
