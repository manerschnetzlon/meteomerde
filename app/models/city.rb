class City < ApplicationRecord
  has_many :weather_previsions, dependent: :destroy
  belongs_to :department
end
