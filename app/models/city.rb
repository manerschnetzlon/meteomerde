class City < ApplicationRecord
  has_many :weather_previsions, dependent: :destroy
end
