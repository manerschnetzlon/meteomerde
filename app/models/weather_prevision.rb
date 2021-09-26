class WeatherPrevision < ApplicationRecord
  belongs_to :city
  belongs_to :weather_type

  validates :date, :temperature, :weather_type, presence: true
  validate :date_must_be_future

  def date_must_be_future
    if date < Date.today + 1
      errors.add(:date, "can't be in the past")
    end
  end
end
