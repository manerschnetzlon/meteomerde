class RemoveColumnsFromWeatherPrevisions < ActiveRecord::Migration[6.1]
  def change
    remove_column :weather_previsions, :temperature_feels_like
  end
end
