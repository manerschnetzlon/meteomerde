class WeatherPrevision < ApplicationRecord
  belongs_to :city
  belongs_to :weather_type

  validates :date, :temperature, :weather_type, presence: true
  validate :date_must_be_future
  validates :date, uniqueness: { scope: :city, message: ' : a prevision already exists for this day and this city' }

  def date_must_be_future
    errors.add(:date, "can't be in the past") if date < Date.today + 1
  end

  def start_time
    date
  end
end
