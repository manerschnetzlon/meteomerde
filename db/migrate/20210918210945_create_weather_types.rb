class CreateWeatherTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_types do |t|
      t.string :name
      t.integer :weight
      t.integer :temperature_max
      t.integer :temperature_min

      t.timestamps
    end
  end
end
