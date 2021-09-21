class AddAdjustmentTemperatureToWeatherType < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_types, :temp, :integer, default: 0
  end
end
