class AddWeightToWeatherTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_types, :weight, :integer
  end
end
