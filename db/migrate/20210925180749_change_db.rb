class ChangeDb < ActiveRecord::Migration[6.1]
  def change
    remove_column :weather_previsions, :wind_speed
    drop_table :wind_directions
  end
end
