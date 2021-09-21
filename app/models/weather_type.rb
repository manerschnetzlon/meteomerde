class WeatherType < ApplicationRecord
  has_many :weather_previsions, dependent: :destroy
  validates :name, presence: true
end
