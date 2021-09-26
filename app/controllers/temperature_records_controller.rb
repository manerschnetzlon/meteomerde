class TemperatureRecordsController < ApplicationController
  def index
    load_temperature_records_csv
  end
end
