class AddTempMinMaxWeatherTypes < ActiveRecord::Migration[6.1]
  def change
    remove_column :weather_types, :temp
    add_column :weather_types, :temperature_max, :integer
    add_column :weather_types, :temperature_min, :integer
  end
end
